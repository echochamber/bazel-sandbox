# Option 2 from here https://github.com/grpc-ecosystem/grpc-gateway#1-using-the-default-mapping
git_root="$(git rev-parse --show-toplevel)"

protoc -I "${git_root}/grpc/proto/" --grpc-gateway_out ./gen/go \
    --grpc-gateway_opt logtostderr=true \
    --grpc-gateway_opt paths=source_relative \
    --grpc-gateway_opt generate_unbound_methods=true \
    "${git_root}/grpc/proto/helloworld.proto"
