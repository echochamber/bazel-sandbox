use serde_derive::{Deserialize, Serialize};
use std::error::Error;
use std::fs::File;
use std::io::prelude::*;
use std::env;
use std::process::{Command};
use std::path::Path;

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
    pub strategy: Option<String>
}

fn load_conf(yaml_file_path: &str) -> Result<ExternalConfigV1, Box<dyn Error>> {
    let mut contents = String::new();
    File::open(yaml_file_path)?.read_to_string(&mut contents)?;
    let conf: ExternalConfigV1 = serde_yaml::from_str(&contents)?;
    Ok(conf)
}

fn main() -> Result<(), Box<dyn Error>> {
    env::set_current_dir(env::var("CARGO_MANIFEST_DIR")?)?;

    // Use buf tool to generate prost and tonic stubs.
    // See ../buf.gen.yaml for more info.
    let mut conf = load_conf(&std::env::var("GEN_YAML_FILE").unwrap())?;
    conf.plugins.iter_mut().for_each(|e| {
        if let Some(plugin) =  &e.plugin {
            if plugin.eq("prost") {
                e.path = Some(std::env::var("PROST_PLUGIN_BIN").unwrap());
            }
            if plugin.eq("tonic") {
                e.path = Some(std::env::var("TONIC_PLUGIN_BIN").unwrap());
            }
            if plugin.eq("prost-crate") {
                e.path = Some(std::env::var("PROST_CRATE_PLUGIN_BIN").unwrap());
                e.path = Some(std::env::var("PROST_CRATE_PLUGIN_BIN").unwrap());
                e.opt.retain(|i| i.find("gen_crate").is_none());
                println!("{}", std::env::var("CARGO_TOML_FILE").unwrap());
                e.opt.push(format!("gen_crate={}", std::env::var("CARGO_TOML_FILE").unwrap()));
            }
        }
    });
    let serialized: String = serde_yaml::to_string(&conf)?;
    println!("Serialized {}", serialized);
    let out_dir = std::env::var("OUT_DIR").unwrap();
    
    let _status = Command::new(std::env::var("BUF_BIN_PATH").unwrap())
        .arg("generate")
        .arg("--template")
        .arg(serde_yaml::to_string(&conf)?)
        .arg("--include-imports")
        .arg("-o").arg(&out_dir)
        .current_dir(std::env::var("CARGO_MANIFEST_DIR").unwrap())
        .status()
        .unwrap();
    
    let mut modrs_template = String::new();
    File::open(std::env::var("MOD_RS_TEMPLATE").unwrap())?.read_to_string(&mut modrs_template)?;
    
    let modrs_f = File::create(Path::new(&out_dir).join("mod.rs"))?;
    let mut modrs_f = std::io::LineWriter::new(modrs_f);

    modrs_f.write_all(modrs_template.as_bytes())?;
    modrs_f.write_all(b"\ntonic::include_proto!(\"src/gen/mod\");")?;
    let paths = std::fs::read_dir(Path::new(&out_dir).join("src/gen"))?;
    let mut paths2 = vec![];
    for path in paths {
        let apath = path.unwrap().path();
        paths2.push(String::from(apath.to_str().unwrap()));
    }
    
    paths2.iter()
    .filter(|e| e.ends_with("tonic.rs")).for_each(|e| {
        // Get last part of file path
        println!("{}", e);
        let relpath = e.rsplit_once("/").unwrap().1.rsplit_once(".tonic.rs").unwrap().0;
        modrs_f.write_all(format!("\ntonic::include_proto!(\"src/gen/{}\");", relpath).as_bytes()).unwrap();
    });

    Ok(())
}
