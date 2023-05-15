# Option 2 from here https://github.com/grpc-ecosystem/grpc-gateway#2-with-custom-annotations

git_root="$(git rev-parse --show-toplevel)"

protoc -I "${git_root}/grpc/proto/" --grpc-gateway_out ./gen/go \
    --grpc-gateway_opt logtostderr=true \
    --grpc-gateway_opt paths=source_relative \
    "${git_root}/grpc/proto/helloworld.proto"