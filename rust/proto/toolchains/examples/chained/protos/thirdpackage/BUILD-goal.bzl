# 
load("@rules_proto//proto:defs.bzl", "proto_library")
load("//rust/proto/toolchains:plugin.bzl", "prost_library", "tonic_library")

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "third_proto",
    srcs = ["third.proto"],
    strip_import_prefix = "/rust/proto/toolchains/examples",
    deps = [
        "//rust/proto/toolchains/examples/chained/protos/secondpackage:second_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
)

prost_library(
    name = "third_prost_rs",
    proto_packages = ["chained.protos.thirdpackage"],
    # externs map can instead be automatically built by looking at attr.proto_packages of deps.
    # externs = {
    #     ".google.api": "::googleapi_rs::google::api",
    #     ".chained.protos.secondpackage": "::second_prost_rs::chained::protos::secondpackage",
    # },
    protos = [
        ":third_proto",
    ],
    deps = [
        "//rust/proto/common:googleapi_rs",
        "//rust/proto/toolchains/examples/chained/protos/secondpackage:second_prost_rs",
    ],
)

tonic_library(
    name = "third_tonic_rs",
    # proto_package be ommitted, provided via ProstInfo provider.
    # proto_package = "chained.protos.thirdpackage", 
    proto = ":third_proto",
    prost_proto = ":third_prost_rs",
)
