git_root="$(git rev-parse --show-toplevel)"

docker run -v `pwd`:/defs namely/gen-grpc-gateway -f  protos/helloworld.proto -s Greeter -o "grpc-gateway/docker-gen"
docker run -v $PWD:/defs namely/protoc-all -f  protos/helloworld.proto -l go -o "grpc-gateway/docker-gen"