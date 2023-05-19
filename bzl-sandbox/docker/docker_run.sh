# TODO: Allow detach?
# TODO: More robut flags/args/options parsing.

set -x

docker load --input "$1"
docker run --rm "$2"
