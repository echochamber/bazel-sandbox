load("@rules_proto//proto:defs.bzl", "proto_library")
load("//rust/proto/toolchains:plugin.bzl", "prost_library")

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "first_proto",
    srcs = ["first.proto"],
    strip_import_prefix = "/rust/proto/toolchains/examples",
)

prost_library(
    name = "first_prost_rs",
    protos = [
        ":first_proto",
    ],
)