jq_object_fields=(
  "int_value"
  "string_value"
  "string_list_value"
  "string_dict_value"
  "fileset_list_value"
  "label_list_dict_value"
  "string_list_dict_value"
  "boolean_value"
  "int_list_value"
  "label_dict_unary_value"
  "label_keyed_string_dict_value"
)

function join_by {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}

jq_object_filter="coalesce(.$(join_by ",." ${jq_object_fields[@]}))"

# def coalesce: coalesce(.[]);
# cat testfile.json | \
# jq ".target[].rule.attribute[1] 
#    | {(.name): {type: .type, value: $jq_object_filter}}"


cat testfile.json | \
jq '
def coalesce(s): first(s | select(. != null) | select(. != []));
def get_bzl_attr(attr): attr | {
    type: .type,
    value: .[
      (.type | ascii_downcase | . + "_value" )
      | sub("^label_list_value"; "string_list_value")
    ]
};

.target[].rule | {
  name: .name,
  rule_class: .rule_class,
  attributes: .attribute | map({key: .name, value: get_bzl_attr(.)}) | from_entries
}
'