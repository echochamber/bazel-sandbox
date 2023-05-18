# TODO List

# Main TODO

1. [x] Backend Rust Web Server running in docker.
2. [x] Docker container for postgres, callable by rust.
3. [x] Grpc Server in Docker Container.
4. [x] Grpc Bridge
5. [x] Codegen for rust procol buffer clients.
6. [x] Protocol buffer dependency management (with buf)
7. [x] Swaggerui - https://petstore.swagger.io/
8. [ ] Bazel for builds.
9. [ ] CI/Auomated Testing of Docker Containers
10. [ ] Parameterize port values in dockerfiles.
11. [ ] Add healthchecks to docker compose.


Try this https://github.com/namely/docker-protoc

## Nice To have TODO:

1. Bind IP V6 address for grpc inside docker.
2. Git submodules to import externally defined protos?
   * Or just a good way to import externally defined protos.
3. Build System
   * Bazel for building.
   * Look into build systems for providing protos to cargo, grpc builds, etc...
   * Pull in external proto defs using a build system (google.api.http protos).

## Libaries/Utils to look into

* [buf](https://github.com/bufbuild/buf)
* [Envoy Proxy](https://www.envoyproxy.io/docs/envoy/latest/intro/what_is_envoy)
* [GRPC Web](https://grpc.io/docs/platforms/web/quickstart/)
* [cargo-chef](https://github.com/LukeMathWalker/cargo-chef)