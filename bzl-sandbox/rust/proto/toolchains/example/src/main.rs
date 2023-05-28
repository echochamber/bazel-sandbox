use log::info;
use tokio::signal;
use tokio::sync::oneshot;
use tonic::{transport::Server, Request, Response, Status};

use googleapi_rs::google::api::{FILE_DESCRIPTOR_SET as GOOGLE_API_DECRIPTORS};
use protoc_wkt::google::protobuf::FILE_DESCRIPTOR_SET as WKT_FILE_DESCRIPTOR_SET;

use annotated_rs::path::to::my::proto::v1::{FILE_DESCRIPTOR_SET as GREETERSERVICE_DESCRIPTORS};
use annotated_rs::path::to::my::proto::v1::{SayHelloRequest, SayHelloResponse};
use annotated_tonic_rs::greeter_service_server::{GreeterServiceServer, GreeterService};

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

pub async fn wait_for_signal(tx: oneshot::Sender<()>) {
    let _ = signal::ctrl_c().await;
    info!("SIGINT received: shutting down");
    let _ = tx.send(());
}



#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    env_logger::init();
    let (signal_tx, singal_rx) = oneshot::channel();

    let _ = tokio::spawn(wait_for_signal(signal_tx));

    let addr = "0.0.0.0:50051".parse()?;
    let greeter = MyGreeter::default();
    info!("Iniating server.");

    let reflection = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(GREETERSERVICE_DESCRIPTORS)
        // Temporarily removing imported types till I figure that out.
        .register_encoded_file_descriptor_set(GOOGLE_API_DECRIPTORS)
        .register_encoded_file_descriptor_set(WKT_FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();
    Server::builder()
        .add_service(GreeterServiceServer::new(greeter))
        .add_service(reflection)
        .serve_with_shutdown(addr, async {
            singal_rx.await.ok();
            info!("Graceful context shutdown");
        }).await?;

    Ok(())
}