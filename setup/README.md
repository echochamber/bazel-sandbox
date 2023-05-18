# Things to do to make this repo work:


1. Instal gcc toolchain `sudo apt-get install build-essential`
2. Install rust.
   1. Install: `curl https://sh.rustup.rs -sSf | sh`
   2. Add to path: `printf "\nsource \"$HOME/.cargo/env\"" >> ~/.bashrc`
3. Install cargo raze
   1. `cargo install cargo-raze`
4. Install openssl
5. Setup rust-project.json so rust-analyzer works.
   1. `bazel run @rules_rust//tools/rust_analyzer:gen_rust_project`




## Nice to haves

1. Grpc stuff
   1. grpcui
      1. `go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest`
   2. grpcurl
      1. `go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest`
   3. grpc_cli