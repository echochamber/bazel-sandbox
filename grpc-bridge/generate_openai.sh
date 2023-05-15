git_root="$(git rev-parse --show-toplevel)"

protoc -I "${git_root}/grpc/proto/" --openapiv2_out ./gen/openapiv2 \
    --openapiv2_opt logtostderr=true \
    "${git_root}/grpc/proto/helloworld.proto"