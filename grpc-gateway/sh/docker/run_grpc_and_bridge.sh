git_root="$(git rev-parse --show-toplevel)"

# Run the Grpc Service
docker run -d --rm --name grpc -p 50052:50052 --network=grpc_bridge grpc

# Run the gateway
docker run  -d --rm --name=grpc-gateway -p 8081:8081 --network=grpc_bridge grpc-gateway --backend=grpc:50052

docker ps -q | xargs -L 1 -P `docker ps | wc -l` docker logs --since 30s -f