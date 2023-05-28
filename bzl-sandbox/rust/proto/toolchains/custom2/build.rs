use prost_build::Config;
use prost_types::{FileDescriptorSet, FileDescriptorProto};
use prost::Message;
use std::io::BufReader;
use std::fs::File;

fn main() -> Result<(), Box<dyn std::error::Error>> {
  let fds_paths = std::env::var("FILE_DESCRIPTOR_SETS").unwrap();
  let fds_files = fds_paths.split(",").collect::<Vec<&str>>();

  // let requests = vec![(Module::from_protobuf_package_name("annotated"), )];
  let mut fds = prost_types::FileDescriptorSet{file: Vec::new()};

  for path in &fds_files {
    let fds_bytes = std::fs::read(&path)?;
    fds.file.extend(prost_types::FileDescriptorSet::decode(&fds_bytes[..]).unwrap().file.clone())
  }
  
  let proto_files: Vec<String> = fds.file.iter().map(|f| f.name.clone().unwrap().to_string()).collect();
  // Tonic not done yet in this version.
  // Use below as an example of how to go from  FileDescriptorSet to a request to tonic build to
  // generate services.
  // https://github.com/neoeinstein/protoc-gen-prost/blob/main/protoc-gen-tonic/src/generator.rs#L32

  
  let mut config = Config::new();
  config
    // .compile_well_known_types()
    .include_file("mod.rs")
    .compile_fds(fds);
  Ok(())
}