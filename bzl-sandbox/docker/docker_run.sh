# TODO: Allow detach?
# TODO: More robust flags/args/options parsing.

set -x



docker load --input "$1"
docker run --rm --publish $3 "$2"
