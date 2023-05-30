load("@aspect_rules_js//npm:defs.bzl", "npm_link_package")

def npm_links():
  npm_link_package(
      name = "node_modules/@myorg/deps_lib",
      src = "//ts/examples/deps_lib",
      root_package = "",
      visibility = ["//ts/examples:__subpackages__"],
  )
