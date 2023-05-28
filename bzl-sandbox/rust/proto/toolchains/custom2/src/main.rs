// This file just exists to confirm things work and are importable.

use rust_proto_lib::simple::dimple::Simple;

fn main() {
  // Statements here are executed when the compiled binary is called.

  let s = Simple{
    age: 11,
    name: String::from("Jason")
  };

  println!("Hello World! {:?}", &"adsa");
} 