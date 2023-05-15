git_root="$(git rev-parse --show-toplevel)"

protoc -I "${git_root}/grpc/proto/" \
    --go_out ${git_root}/gen/go/ --go_opt paths=source_relative \
    --go-grpc_out ${git_root}/gen/go/ --go-grpc_opt paths=source_relative \
    --proto_path="${git_root}/grpc/proto/" \
    "${git_root}/grpc/proto/helloworld.proto"