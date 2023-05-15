# Docker compose steps

```bash
docker compose build
docker compose up -d
curl http://localhost:8080/postgres


# Later
docker compose down
```

# TODO List

1. [x] Backend Rust Web Server running in docker.
2. [x] Docker container for postgres, callable by rust.
3. [x] Grpc Server in Docker Container.
4. [ ] Grpc Bridge
5. [ ] Bazel for building.