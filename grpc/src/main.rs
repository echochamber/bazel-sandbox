use tonic::{transport::Server, Request, Response, Status};

use echochamber_rdproto::echochamber::helloworld::v1::greeter_service_server::{GreeterServiceServer, GreeterService};
use echochamber_rdproto::echochamber::helloworld::v1::{SayHelloRequest, SayHelloResponse};
// use protoc_wkt::google::protobuf::{FILE_DESCRIPTOR_SET as GOOGLE_PROTOBUF_FILE_DESCRIPTOR_SET};
use echochamber_rdproto::WKT_FILE_DESCRIPTOR_SET;





#[derive(Debug, Default)]
pub struct MyGreeter {}


#[tonic::async_trait]
impl GreeterService for MyGreeter {
    async fn say_hello(
        &self,
        request: Request<SayHelloRequest>, // Accept request of type HelloRequest
    ) -> Result<Response<SayHelloResponse>, Status> { // Return an instance of type HelloReply
        println!("Got a request: {:?}", request);

        let reply = SayHelloResponse {
            message: format!("Hello {}!", request.into_inner().name).into(), // We must use .into_inner() as the fields of gRPC requests and responses are private
        };

        Ok(Response::new(reply)) // Send back our formatted greeting
    }
}


#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let addr = "0.0.0.0:50051".parse()?;
    let greeter = MyGreeter::default();

    let reflection = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(echochamber_rdproto::echochamber::helloworld::v1::FILE_DESCRIPTOR_SET)
        .register_encoded_file_descriptor_set(echochamber_rdproto::google::api::FILE_DESCRIPTOR_SET)
        .register_encoded_file_descriptor_set(WKT_FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    Server::builder()
        .add_service(GreeterServiceServer::new(greeter))
        .add_service(reflection)
        .serve(addr)
        .await?;

    Ok(())
}