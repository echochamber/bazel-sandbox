use tonic::{transport::Server, Request, Response, Status};

use echochamber_rdproto::echochamber::helloworld::v1::{Greeter, GreeterServer};
use echochamber_rdproto::echochamber::helloworld::v1::{SayHelloResponse, SayHelloResponse};

pub mod hello_world {
    tonic::include_proto!("echochamber.helloworld.v1"); // The string specified here must match the proto package name
}

#[derive(Debug, Default)]
pub struct MyGreeter {}


#[tonic::async_trait]
impl Greeter for MyGreeter {
    async fn say_hello(
        &self,
        request: Request<HelloRequest>, // Accept request of type HelloRequest
    ) -> Result<Response<HelloReply>, Status> { // Return an instance of type HelloReply
        println!("Got a request: {:?}", request);

        let reply = hello_world::HelloReply {
            message: format!("Hello {}!", request.into_inner().name).into(), // We must use .into_inner() as the fields of gRPC requests and responses are private
        };

        Ok(Response::new(reply)) // Send back our formatted greeting
    }
}


#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let addr = "0.0.0.0:50052".parse()?;
    let greeter = MyGreeter::default();

    let reflection = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(tonic::include_file_descriptor_set!("descriptor"))
        .build()
        .unwrap();

    Server::builder()
        .add_service(GreeterServer::new(greeter))
        .add_service(reflection)
        .serve(addr)
        .await?;

    Ok(())
}