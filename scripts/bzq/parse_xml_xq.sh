workspace_path="$(bazel info workspace)"
result=$(
  bazel query --output=xml \
  'attr("generator_name", "^node_modules$", "//ts/examples/linked/...")' 2> /dev/null \
  | sed '1 s/version="1.1"/version="1.0"/g' \
  | yq -p=xml  '
  .query.rule[] |
  select(.["+@name"] = "node_modules" and .["+@class"] = "npm_link_package_store") |
  .["+@location"] |
  [.] |
  length |
   . '
  #  length |
  # unique_by(.["+@location"]) |
  # .query.rule[].string[]["+@name"],.query.rule[].string[]["+@value"]
  # .+@location' \

  # | sed 's#\(.*\)/BUILD.*#\1#g' \
  # | sed "s:$workspace_path/::"
)
echo "$result"
