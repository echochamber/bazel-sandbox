git_root="$(git rev-parse --show-toplevel)"

mkdir -p "${git_root}/grpc-gateway/gen/go"

protoc -I "${git_root}/protos/" \
    --go_out ${git_root}/grpc-gateway/gen/go/ --go_opt paths=source_relative \
    --go-grpc_out ${git_root}/grpc-gateway/gen/go/ --go-grpc_opt paths=source_relative \
    --proto_path="${git_root}/protos/" \
    "${git_root}/protos/helloworld.proto"