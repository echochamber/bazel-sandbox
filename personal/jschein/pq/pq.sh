BZBIN_DIR="$(bazel info bazel-bin)"
WORKSPACE_DIR="$(bazel info workspace)"
BZ_OUTDIR="$WORKSPACE_DIR/.bazel/out"

TARGET="${1:-//rd/proto/echochamber/helloworld/v1:v1_proto}"

QUERY_RESULT_PROTO=@bazel_tools//src/main/protobuf:build_proto

bz_output_files() {
  bazel cquery --output starlark --starlark:expr '"\n".join([f.path for f in target.files.to_list()])' $1 2>/dev/null
}

FDSET="$BZ_OUTDIR/$(bz_output_files $QUERY_RESULT_PROTO | sed -e "s|^bazel-out/||g")"

# 1. Query a bazel target, with proto output
# 2. Pipe binary proto output to pq so we can turn it into json
# 3. jq query to turn messy json into something more readable
# You pipe to less and keep color like so: | jq -C '.' | less -r
bazel query --output=proto $TARGET \
| pq --msgtype blaze_query.QueryResult --fdsetfile=$FDSET \
| jq '
def coalesce(s): first(s | select(. != null) | select(. != []));
def get_bzl_attr(attr): attr | {
    type: .type,
    value: .[
      (.type | ascii_downcase | . + "_value" )
      | sub("^label_list_value"; "string_list_value")
    ]
};
def falsy(a):
  a | select(. != []) | select(. != null) | select(. != {}) | select(. != "");


.target[].rule
| {
    name: .name,
    rule_class: .rule_class,
    attributes: .attribute 
      | map({key: .name, value: get_bzl_attr(.)})
      | map(select(falsy(.value.value)))
      | from_entries
  }'
# # [1,2,[],null] | map(falsy(.))