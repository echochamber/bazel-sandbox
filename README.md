# Bazel + Docker + Rust

Sandbox where I'm learning how to set up bazel, use docker, and get the two of
them working nicely with rust and protocol buffers.

**Goals**

* Manage external proto dependencies in a sane way.
* Build and run images locally using just bazel targets.
* Build rust binaries using just bazel targets.
* Rust binaries can use protocol buffers.
* Frontend & Backend deployable via bazel.

## Main TODO

1. [x] Backend Rust Web Server running in docker.
2. [x] Docker container for postgres, callable by rust.
3. [x] Grpc Server in Docker Container.
4. [x] Grpc Bridge
5. [x] Codegen for rust procol buffer clients.
6. [x] Protocol buffer dependency management (with buf)
7. [x] Swaggerui - https://petstore.swagger.io/
8. [x] Bazel for builds.
9. [x] Get rd/proto building with bazel.
10. [x] rd/grpc Building with bazel
11. [x] Get rd/proto/grpc_gateway building/running via bazel
    1.  [ ] Generate gatway's server.go file from .proto files inputs (I think buf can do this?) 
    2.  [x] Rule to build .image for go server for binary generated above.
12. [x] Start generating swagger file with buf via bazel (gateway.gen.yaml).
13. [x] Improve docker/docker_run.sh so it uses args/flags/options etc...
14. [ ] Get docker compose runable from bazel
    1. [x] Generate image file.
    2. [x] Build rule to load images into docker
    3. [ ] Build rule that generates docker.compose given a list of image docker_run targets.
    4. [ ] Build rule that runs docker compose
15. [ ] Get working frontend + backend example using all of the above
    1.  GRPC Backend
    2.  GRPC Proxy Gateway
    3.  Frontend examples calling via GRPCWEB.
    4.  Offline batch script example calling via http using gateway proxy.
16. [ ] Build rule to deploy an image as a server to Google Cloud Run

## Nice To have TODO:

1. Bind IP V6 address for grpc inside docker.
2. Migrate to bzmod (if rules_rust is stable enough).
3. Debug rust-analyzer having issues with generated source files.

## Libaries/Utils to look into

* [buf](https://github.com/bufbuild/buf)
* [Envoy Proxy](https://www.envoyproxy.io/docs/envoy/latest/intro/what_is_envoy)
* [GRPC Web](https://grpc.io/docs/platforms/web/quickstart/)
* [cargo-chef](https://github.com/LukeMathWalker/cargo-chef)


# Issues to eventually look into:

* Docker/Image issues for rust binaries
  * Bazel built images on docker_rules (distroless_cc image) run into `GLIBC_2.34 not found` (same for 2.33, 2.32... 2.29).
    * My ubuntu version: `lsb_release -a`
      * Ubuntu 22.04.2 LTS
    * My GLIBC version: `ldd --version`
      * Ubuntu GLIBC 2.35-0ubuntu3.1
  * Images built with debian don't treat my binary as a binary (file not found).
* Neither of the above issues occur for images built with a Dockerfile.
* Images built with oci_container using ubuntu base work fine.