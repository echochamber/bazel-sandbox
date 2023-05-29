bazel run //bzl-sandbox/rd/gateway:server_load
bazel run //bzl-sandbox/rd/grpc:server_load
bazel build //bzl-sandbox/rd/proto/echochamber/helloworld/v1:v1_openapiv2
docker compose up