use src_proto_summation::summation_server::SummationServer;
use std::env;
use std::net::{IpAddr, Ipv4Addr, SocketAddr};
use to_unit::ToUnit;
use tokio;
use tonic::transport::Server;

mod my_summation;
use my_summation::MySummation;

#[tokio::main(flavor = "current_thread")]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("Starting Tonic GRPC Server");
    let port = env::var("PORT")
        .map(|p| p.parse::<u16>())
        .unwrap_or(Ok(50051))?;
    println!("Starting server on 0.0.0.0:{}", port);
    let addr = SocketAddr::new(IpAddr::V4(Ipv4Addr::new(0, 0, 0, 0)), port);
    let summation = MySummation::new();

    // inject the SIGINT(=kill=CTRL+C) waiting to the tonic future
    let (f_tonic, aborter) = futures::future::abortable(
        Server::builder()
            .add_service(SummationServer::new(summation))
            .serve(addr),
    );
    let f_sigint = async move {
        tokio::signal::ctrl_c().await.to_unit();
        println!("Kill Signal Received");
        aborter.abort();
    };

    let (_r, _) = futures::future::join(f_tonic, f_sigint).await;

    Ok(())
}
