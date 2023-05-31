#![allow(unused_imports)]
// This only exists to test verify prost generated rust with externs correctly
// provided. So ignore unused_imports warning.
use googleapi_rs::google::api::{FILE_DESCRIPTOR_SET as GOOGLE_API_DECRIPTORS};
use protoc_wkt::google::protobuf::FILE_DESCRIPTOR_SET as WKT_FILE_DESCRIPTOR_SET;

use third_prost_rs::chained::protos::thirdpackage::{FILE_DESCRIPTOR_SET as ThirdService_DESCRIPTORS};
use third_prost_rs::chained::protos::thirdpackage::{ThirdRequest, ThirdResponse};
use third_tonic_rs::third_service_server::{ThirdServiceServer, ThirdService};

fn main() {
  println!("Hello world");
}