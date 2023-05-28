use prost_build::Config;
use prost_types::{FileDescriptorSet, FileDescriptorProto};
use prost::Message;
use std::io::BufReader;
use std::fs::File;

fn main() -> Result<(), Box<dyn std::error::Error>> {
  let fds_paths = std::env::var("FILE_DESCRIPTOR_SETS").unwrap();
  let fds_files = fds_paths.split(",").collect::<Vec<&str>>();

  // println!("{:?}", &fds_path);
  // println!("{:?}", &pf_paths);

  // let requests = vec![(Module::from_protobuf_package_name("annotated"), )];
  let mut fds = prost_types::FileDescriptorSet{file: Vec::new()};

  for path in &fds_files {
    let fds_bytes = std::fs::read(&path)?;
    fds.file.extend(prost_types::FileDescriptorSet::decode(&fds_bytes[..]).unwrap().file.clone())
  }
  
  println!("{:#?}", &fds);

  
  let mut config = Config::new();
  config
    // .compile_well_known_types()
    .include_file("mod.rs")
    .compile_fds(fds);

  // Generate
  // let mut config = Config::new();
  // config.generate(&fds_path);
  
  // let o: Option<i64> = Option::None;
  // o.unwrap();
  Ok(())
}