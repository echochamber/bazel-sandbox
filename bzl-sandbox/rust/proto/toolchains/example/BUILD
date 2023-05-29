load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_buf//buf:defs.bzl", "buf_lint_test")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("//bzl-sandbox/rust/proto/toolchains:plugin.bzl", "prost_library", "tonic_library")
load("@rules_rust//rust:defs.bzl", "rust_binary")

proto_library(
    name = "annotated_proto",
    srcs = ["annotated.proto"],
    visibility = ["//visibility:public"],
    deps = ["@go_googleapis//google/api:annotations_proto"],
)

prost_library(
    name = "annotated_rs",
    externs = {
        ".google.api": "::googleapi_rs::google::api",
    },
    protos = [
        ":annotated_proto",
    ],
    deps = [
        "//bzl-sandbox/rust/proto/common:googleapi_rs",
    ],
)

tonic_library(
    name = "annotated_tonic_rs",
    externs = {
        ".": "::annotated_rs",
    },
    service_package = "path.to.my.proto.v1",
    service_proto = ":annotated_proto",
    deps = [
        ":annotated_rs",
    ],
)

rust_binary(
    name = "main",
    srcs = ["src/main.rs"],
    deps = [
        ":annotated_rs",
        ":annotated_tonic_rs",
        "//bzl-sandbox/rust/proto/common:googleapi_rs",
        "//third_party/rust:env_logger",
        "//third_party/rust:log",
        "//third_party/rust:protoc_wkt",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:tonic_reflection",
    ],
)

buf_lint_test(
    name = "custom2_proto_lint",
    targets = [":custom2_proto"],
)

go_proto_library(
    name = "custom2_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rust/proto/toolchains/custom2",
    proto = ":annotated_proto",
    visibility = ["//visibility:public"],
    deps = ["@go_googleapis//google/api:annotations_go_proto"],
)

go_library(
    name = "custom2",
    embed = [":custom2_go_proto"],
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rust/proto/toolchains/custom2",
    visibility = ["//visibility:public"],
)
