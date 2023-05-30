bazel query --output=build \
  'attr("generator_name", "^node_modules$", "//ts/examples/linked:node_modules")'