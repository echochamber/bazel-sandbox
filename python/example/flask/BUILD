load("@my_deps//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary")

package(default_visibility = ["//python/example:internal"])

py_binary(
    name = "main",
    srcs = ["main.py"],
    deps = [
        "//python/example/calculator",
        requirement("Flask"),
        requirement("absl-py"),
        requirement("ipython"),
    ],
)
