load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")
load("@rules_proto_grpc//python:defs.bzl", "python_proto_library")

load("@pip_deps//:requirements.bzl", "requirement")

load("@rules_proto//proto:defs.bzl", "proto_library")

proto_library(
    name = "build_proto",
    srcs = ["build.proto"],
    deps = [
        # "@bazel_tools//src/main/protobuf:build_proto",
        "@com_google_protobuf//:any_proto",
    ],
)

python_proto_library(
    name = "build_proto_py_proto",
    protos = [":build_proto"],
    visibility = ["//visibility:public"],
    deps = [
    ]
)

py_binary(
    name = "protodump",
    srcs = ["protodump.py"],
    deps = [
        ":build_proto_py_proto",
        requirement("absl-py"),
        requirement("ipython"),
        requirement("protobuf"),
    ],
    # data = [
    #     "data.concise.json"
    # ]
)
