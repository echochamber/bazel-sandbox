use tonic::{transport::Server, Request, Response, Status};

use echochamber_rdproto::echochamber::helloworld::v1::greeter_service_server::{GreeterServiceServer, GreeterService};
use echochamber_rdproto::echochamber::helloworld::v1::{SayHelloRequest, SayHelloResponse};
use echochamber_rdproto::WKT_FILE_DESCRIPTOR_SET;
use echochamber_rdproto::google::api::{FILE_DESCRIPTOR_SET as GOOGLE_API_DECRIPTORS};
use echochamber_rdproto::echochamber::helloworld::v1::{FILE_DESCRIPTOR_SET as GREETERSERVICE_DESCRIPTORS}

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
        .register_encoded_file_descriptor_set(GREETERSERVICE_DESCRIPTORS)
        .register_encoded_file_descriptor_set(GOOGLE_API_DECRIPTORS)
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