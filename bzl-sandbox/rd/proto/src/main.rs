// This file just exists to confirm things work and are importable.
use helloworld_rust_proto::greeter_service_client::*;

fn main() {
  let mut thing = deps::Http::new();
  thing.set_fully_decode_reserved_expansion(true);

  let thing2 = helloworld_rust_proto::echochamber::helloworld::v1::SayHelloRequest {
    name: "Jason".into()
  };
  // Statements here are executed when the compiled binary is called.

  println!("Hello World! {:?}, {:?}", thing, thing2);
}