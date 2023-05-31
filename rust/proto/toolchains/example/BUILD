load("@rules_proto//proto:defs.bzl", "proto_library")
load("//rust/proto/toolchains:plugin.bzl", "prost_library", "tonic_library")
load("@rules_rust//rust:defs.bzl", "rust_binary")

proto_library(
    name = "some_proto",
    srcs = ["some.proto"],
    visibility = ["//visibility:public"],
    deps = ["@go_googleapis//google/api:annotations_proto"],
)

prost_library(
    name = "some_prost_rs",
    externs = {
        ".google.api": "::googleapi_rs::google::api",
    },
    protos = [
        ":some_proto",
    ],
    deps = [
        "//rust/proto/common:googleapi_rs",
    ],
)

tonic_library(
    name = "some_tonic_rs",
    externs = {
        ".": "::some_prost_rs",
    },
    service_package = "path.to.my.proto.v1",
    service_proto = ":some_proto",
    deps = [
        ":some_prost_rs",
    ],
)

rust_binary(
    name = "main",
    srcs = ["src/main.rs"],
    deps = [
        ":some_prost_rs",
        ":some_tonic_rs",
        "//rust/proto/common:googleapi_rs",
        "//third_party/rust:env_logger",
        "//third_party/rust:log",
        "//third_party/rust:protoc_wkt",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:tonic_reflection",
    ],
)
