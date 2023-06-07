WORKSPACE_ROOT="$(bazel info workspace)"
# QUERY_RESULT=${WORKSPACE_ROOT}/personal/jschein/pq/test/bzq_output_proto.bin
# bzq --output=proto  @bazel_tools//src/main/protobuf:build_proto > $(WORKSPACE_ROOT)/personal/jschein/pq/test/bzq_output_proto.bin
_DEBUG=0

# Build fdset for blaze_query.QueryResult
target="${1:-@bazel_tools//src/main/protobuf:build_proto}"
if [ $_DEBUG -ne 0 ]; then
  printf "Target is $target\n"
fi
# Build the fdset for the blaze_query.QueryResult, since pq will need it.
bazel build "@bazel_tools//src/main/protobuf:build_proto" 2> /dev/null
RESULT=$?
if [ $RESULT -ne 0 ]; then
    printf "Build Failure: Could not build fdset for blaze_query.QueryResult\n"
    exit $RESULT
fi
fdset=$(bazel  cquery --symlink_prefix=.bazel/  --output starlark --starlark:expr \
 '"\n".join([f.path for f in target.files.to_list()])' \
 @bazel_tools//src/main/protobuf:build_proto 2> /dev/null \
 | sed -e 's|bazel-out|.bazel/out|')
if [ $_DEBUG -ne 0 ]; then
  printf "Fdset path is $fdset\n"
fi

set -o pipefail
bazel query --output=proto  $target 2> /dev/null | /home/jschein/Code/external/pq/./target/debug/pq --pretty_json  --msgtype blaze_query.QueryResult --fdsetfile ${WORKSPACE_ROOT}/${fdset}

#  sudo apt-get install expect-dev   # for unbuffer