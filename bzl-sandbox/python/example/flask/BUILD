load("@my_deps//:requirements.bzl", "requirement")

package(default_visibility = ["//bzl-sandbox/python/example:internal"])


py_binary(
  name = "main",
  srcs = ["main.py"],
  deps = [
    "//bzl-sandbox/python/example/calculator:calculator",
    requirement("Flask")
  ]
)