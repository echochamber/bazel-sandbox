// See ./README.md for more info.

use serde_derive::{Deserialize, Serialize};
use std::error::Error;
use std::fs::File;
use std::io::prelude::*;
use std::path::Path;
use std::process::Command;

// Represents a buf.lock file.
// Based on
// https://github.com/bufbuild/buf/blob/2a1cf0ffb5fe804c58ca5a8694a1ef6a94738046/private/bufpkg/buflock/buflock.go#L63
#[derive(Debug, PartialEq, Serialize, Deserialize, Default)]
#[serde(default)]
struct ExternalLockV1 {
    version: String,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    deps: Vec<ExternalLockDepV1>,
}

#[derive(Debug, PartialEq, Serialize, Deserialize, Default)]
#[serde(default)]
struct ExternalLockDepV1 {
    remote: Option<String>,
    owner: Option<String>,
    repository: Option<String>,
    commit: Option<String>,
    digest: Option<String>,
    branch: Option<String>,
    create_time: Option<String>,
}

// Represents a buf.gen.yaml file.
// Based on
// https://github.com/bufbuild/buf/blob/2a1cf0ffb5fe804c58ca5a8694a1ef6a94738046/private/buf/bufgen/bufgen.go#L171
#[derive(Debug, PartialEq, Serialize, Deserialize, Default)]
#[serde(default)]
pub struct ExternalConfigV1 {
    #[serde(skip_serializing_if = "Option::is_none")]
    version: Option<String>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    plugins: Vec<ExternalPluginConfigV1>,
}

#[derive(Debug, PartialEq, Serialize, Deserialize, Default)]
#[serde(default)]
pub struct ExternalPluginConfigV1 {
    #[serde(skip_serializing_if = "Option::is_none")]
    pub plugin: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub revision: Option<i64>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub remote: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub out: Option<String>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub opt: Vec<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub path: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub protoc_path: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub strategy: Option<String>,
}

fn load_conf(yaml_file_path: &str) -> Result<ExternalConfigV1, Box<dyn Error>> {
    let mut contents = String::new();
    File::open(yaml_file_path)?.read_to_string(&mut contents)?;
    let mut conf: ExternalConfigV1 = serde_yaml::from_str(&contents)?;

    // Plugin paths can't be set in the yaml file itself, since they are being provided by
    // bazel and so aren't known until build time.
    // So we add these here after loading the yaml file.
    conf.plugins.iter_mut().for_each(|e| {
        if let Some(plugin) = &e.plugin {
            if plugin.eq("prost") {
                e.path = Some(std::env::var("PROST_PLUGIN_BIN").unwrap());
            }
            if plugin.eq("tonic") {
                e.path = Some(std::env::var("TONIC_PLUGIN_BIN").unwrap());
            }
            if plugin.eq("prost-crate") {
                e.path = Some(std::env::var("PROST_CRATE_PLUGIN_BIN").unwrap());
                e.opt.retain(|i| i.find("gen_crate").is_none());
                e.opt.push(format!(
                    "gen_crate={}",
                    std::env::var("CARGO_TOML_FILE").unwrap()
                ));
            }
        }
    });

    Ok(conf)
}

fn load_lock_conf(lock_file_path: &str) -> Result<ExternalLockV1, Box<dyn Error>> {
    let mut contents = String::new();
    File::open(lock_file_path)?.read_to_string(&mut contents)?;
    Ok(serde_yaml::from_str(&contents)?)
}

fn generate_lib_rs(out_dir: &str) -> Result<(), Box<dyn Error>> {
    // Initialize mod.rs file using template.
    let mut modrs_template = String::new();
    File::open(std::env::var("MOD_RS_TEMPLATE").unwrap())?.read_to_string(&mut modrs_template)?;
    let modrs_f = File::create(Path::new(&out_dir).join("mod.rs"))?;
    let mut modrs_f = std::io::LineWriter::new(modrs_f);
    modrs_f.write_all(modrs_template.as_bytes())?;

    // Add include_proto! for the mod.rs file generated by protoc-gen-prost-crate
    // That mod.rs file will include all the generated prost protos.
    modrs_f.write_all(b"\ntonic::include_proto!(\"src/gen/mod\");")?;

    let paths = std::fs::read_dir(Path::new(&out_dir).join("src/gen"))?;
    let mut paths2 = vec![];
    for path in paths {
        let apath = path.unwrap().path();
        paths2.push(String::from(apath.to_str().unwrap()));
    }

    // Add include_proto! macros for service def files generated by protoc-gen-tonic
    paths2
        .iter()
        .filter(|e| e.ends_with("tonic.rs"))
        .for_each(|e| {
            // Get last part of file path
            let relpath = e
                .rsplit_once("/")
                .unwrap()
                .1
                .rsplit_once(".tonic.rs")
                .unwrap()
                .0;
            modrs_f
                .write_all(format!("\ntonic::include_proto!(\"src/gen/{}\");", relpath).as_bytes())
                .unwrap();
        });

    Ok(())
}
// The buf export step may not be necessary after refactor, will test later.
fn do_buf_export(
    yaml_lock_conf: &ExternalLockV1,
    buf_export_path: &Path,
    cargo_dir: &str,
) -> Result<(), Box<dyn Error>> {
    let mut command = Command::new(std::env::var("BUF_BIN_PATH").unwrap());
    command
        .arg("export")
        .arg("-o")
        .arg(&buf_export_path)
        .arg("--exclude-path")
        .arg(format!(
            "{}/module/data/buf.build/",
            &yaml_lock_conf.version
        ))
        .arg(&cargo_dir);

    command.status().map(|_| ())?;
    Ok(())
}

fn do_buf_generate(
    conf: &ExternalConfigV1,
    buf_export_path: &Path,
    out_dir: &str,
) -> Result<(), Box<dyn Error>> {
    let mut command = Command::new(std::env::var("BUF_BIN_PATH").unwrap());
    command
        .arg("generate")
        .arg("--template")
        .arg(serde_yaml::to_string(&conf)?)
        .arg("--include-imports")
        .arg("-o")
        .arg(&out_dir);

    // Don't include the protos from buf.build that we didn't explicitly export earlier.
    //
    // Longer explaination for exclude-path flags
    //     For some reason when buf commands are executed in this build script, buf build has two copies of externally defined
    //     proto files in scope, so we need to  --exclude_path one of the copies
    //     Two paths buf was finding files in were:
    //         ${RUNFILES_DIR}/rustdocker/bzl-sandbox/rd/proto/google/api/
    //         ${RUNFILES_DIR}/rustdocker/bzl-sandbox/rd/proto/v1/module/data/buf.build/googleapis/googleapis/cc916c31859748a68fd229a3c8d7a2e8/google/api/
    //     *External deps were only available if lockfile was included as a data dep. Don't fully understand why/how, but it works now.
    if buf_export_path.join("v1").is_dir() {
        command
            .arg("--exclude-path")
            .arg("v1/module/data/buf.build/");
    }
    if buf_export_path.join("v2").is_dir() {
        command
            .arg("--exclude-path")
            .arg("v2/module/data/buf.build/");
    }
    let _status = command.current_dir(&buf_export_path).status()?;

    Ok(())
}

// Use buf tool to generate prost and tonic stubs.
fn main() -> Result<(), Box<dyn Error>> {
    let cargo_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
    let conf = load_conf(&std::env::var("GEN_YAML_FILE").unwrap())?;
    let out_dir = std::env::var("OUT_DIR").unwrap();

    let buf_export_path = Path::new(&out_dir).join("bufexport/protos/");
    std::fs::create_dir_all(&buf_export_path)?;

    let lock_conf = load_lock_conf(&std::env::var("BUF_LOCK_FILE").unwrap())?;
    // We use buf export to write .proto files of upstream dependencies.
    do_buf_export(&lock_conf, &buf_export_path, &cargo_dir)?;
    // Generates the rust code using buf and providing it with the prost/tonic plugins.
    do_buf_generate(&conf, &buf_export_path, &out_dir)?;

    // Add include_proto! macros for files generated by protoc-gen-tonic
    generate_lib_rs(&out_dir)?;

    Ok(())
}
