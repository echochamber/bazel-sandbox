# Option 2 from here https://github.com/grpc-ecosystem/grpc-gateway#2-with-custom-annotations

git_root="$(git rev-parse --show-toplevel)"

mkdir -p "${git_root}/grpc-gateway/gen/go"

protoc -I "${git_root}/protos/" --grpc-gateway_out "${git_root}/grpc-gateway/gen/go" \
    --grpc-gateway_opt logtostderr=true \
    --grpc-gateway_opt paths=source_relative \
    "${git_root}/protos/helloworld.proto"