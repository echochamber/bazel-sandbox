# Docker compose steps

```bash
docker compose build
docker compose up -d
curl http://localhost:8080/postgres


# Later
docker compose down
```

# TODO List

# Main TODO

1. [x] Backend Rust Web Server running in docker.
2. [x] Docker container for postgres, callable by rust.
3. [x] Grpc Server in Docker Container.
4. [ ] Grpc Bridge
5. [ ] Bazel for building.

Try this https://github.com/namely/docker-protoc

## Nice To have TODO:

1. Bind IP V6 address for grpc inside docker.
2. Git submodules to import externally defined protos?
   * Or just a good way to import externally defined protos.

## Libaries/Utils to look into

* [buf](https://github.com/bufbuild/buf)
* [Envoy Proxy](https://www.envoyproxy.io/docs/envoy/latest/intro/what_is_envoy)
* [GRPC Web](https://grpc.io/docs/platforms/web/quickstart/)


# Learning Topics

* L4/L7 Proxies & https://en.wikipedia.org/wiki/OSI_model