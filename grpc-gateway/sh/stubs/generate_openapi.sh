git_root="$(git rev-parse --show-toplevel)"


mkdir -p "${git_root}/grpc-gateway/gen/openapiv2"

protoc -I "${git_root}/protos/" --openapiv2_out "${git_root}/grpc-gateway/gen/openapiv2" \
    --openapiv2_opt logtostderr=true \
    "${git_root}/protos/helloworld.proto"