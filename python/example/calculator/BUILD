load("@rules_python//python:defs.bzl", "py_library", "py_test")

package(default_visibility = ["//python/example:internal"])

py_library(
    name = "calculator",
    srcs = ["calculator.py"],
    visibility = ["//visibility:public"],
)

py_test(
    name = "calculator_test",
    srcs = ["calculator_test.py"],
    deps = [
        ":calculator",
    ],
)
