# Things to do to make this repo work:


1. Instal gcc toolchain `sudo apt-get install build-essential`
2. Install rust.
   - Install: `curl https://sh.rustup.rs -sSf | sh`
   - Add to path: `printf "\nsource \"$HOME/.cargo/env\"" >> ~/.bashrc`
3. Install cargo raze
   - `cargo install cargo-raze`
4. Setup rust-project.json so rust-analyzer works.
   - `bazel run @rules_rust//tools/rust_analyzer:gen_rust_project`
5. Install protoc plugins for rust (prost for protos, tonic for grpc):
   - Either cd into this directory and run go install or
```sh
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
```
6. Install bazelisk, which installs bazel.
7. Install bazel buildtools
```sh
go install github.com/bazelbuild/buildtools/buildozer@latest
go install github.com/bazelbuild/buildtools/unused_deps@latest
go install github.com/bazelbuild/buildtools/buildifier@latest
```


## Nice to haves

1. Grpc stuff
   1. grpcui
      1. `go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest`
   2. grpcurl
      1. `go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest`
   3. grpc_cli