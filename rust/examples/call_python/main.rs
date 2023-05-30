use std::env;
use std::error::Error;
use std::process::Command;

fn main() -> Result<(), Box<dyn Error>> {
    let python = env!("PYTHON_PATH");
    println!("env python is {:?}", &python);
    // Calls python interpretter
    let res = Command::new(env::current_dir()?.join(&python))
        .arg("-c")
        // Python command being run
        .arg("print('hello from python')")
        .output()
        .expect("failed to execute process");
    println!("{:?}", std::str::from_utf8(&res.stdout)?);
    Ok(())
}
