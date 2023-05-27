// This file just exists to confirm things work and are importable.

fn main() {

  let thing2 = helloworld_rust_proto::echochamber::helloworld::v1::SayHelloRequest {
    name: "Jason".into()
  };
  // Statements here are executed when the compiled binary is called.

  println!("Hello World! {:?}", thing2);
}