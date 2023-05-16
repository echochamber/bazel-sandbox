git_root="$(git rev-parse --show-toplevel)"

docker build -t grpc-gateway  "${git_root}/gen/grpc-gateway"
docker build -t grpc "${git_root}/grpc"