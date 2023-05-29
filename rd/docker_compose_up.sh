THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

bazel run //rd/gateway:server_load
bazel run //rd/grpc:server_load
bazel build //rd/proto/echochamber/helloworld/v1:v1_openapiv2
docker compose -f $THIS_DIR/compose.yaml up 