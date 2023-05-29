load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@rules_buf//buf:defs.bzl", "buf_lint_test")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto_grpc//grpc-gateway:defs.bzl", "gateway_grpc_library", "gateway_openapiv2_compile")
load("//rust/proto/toolchains:plugin.bzl", "prost_library", "tonic_library")

package(default_visibility = ["//rd:internal"])

# TODO: Figure out why gazelle doesn't know the origin of the gateway dep and keeps replacing it with
# //protoc-gen-openapiv2/options:annotations_proto
# gazelle:resolve proto protoc-gen-openapiv2/options/annotations.proto @com_github_grpc_ecosystem_grpc_gateway_v2//protoc-gen-openapiv2/options:options_proto

proto_library(
    name = "v1_proto",
    srcs = ["greeter.proto"],
    deps = [
        "@com_github_grpc_ecosystem_grpc_gateway_v2//protoc-gen-openapiv2/options:options_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
)

prost_library(
    name = "v1_proto_rs",
    externs = {
        ".google.api": "::googleapi_rs::google::api",
    },
    protos = [
        ":v1_proto",
    ],
    deps = [
        "//rust/proto/common:googleapi_rs",
    ],
)

tonic_library(
    name = "v1_tonic_rs",
    externs = {
        ".": "::v1_proto_rs",
    },
    service_package = "echochamber.helloworld.v1",
    service_proto = ":v1_proto",
    deps = [
        ":v1_proto_rs",
    ],
)

go_proto_library(
    name = "v1_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/echochamber/bazel-sandbox/rd/proto/echochamber/helloworld/v1",
    proto = ":v1_proto",
    deps = [
        "@com_github_grpc_ecosystem_grpc_gateway_v2//protoc-gen-openapiv2/options:options_proto",
        "@go_googleapis//google/api:annotations_go_proto",
    ],
)

go_library(
    name = "v1_go",
    embed = [":v1_go_proto"],
    importpath = "github.com/echochamber/bazel-sandbox/rd/proto/echochamber/helloworld/v1",
)

gateway_openapiv2_compile(
    name = "v1_openapiv2",
    protos = [":v1_proto"],
)

gateway_grpc_library(
    name = "v1_gateway",
    importpath = "github.com/echochamber/bazel-sandbox/rd/proto/echochamber/helloworld/v1/v1_gateway",
    options = {
        "@rules_proto_grpc//grpc-gateway:grpc_gateway_plugin": [
            "paths=source_relative",
            "omit_package_doc=1",
        ],
    },
    protos = [":v1_proto"],
    deps = [
        "@com_github_grpc_ecosystem_grpc_gateway_v2//protoc-gen-openapiv2/options:options_go_proto",
    ],
)

buf_lint_test(
    name = "v1_proto_lint",
    config = "//rd/proto:buf.yaml",
    targets = [":v1_proto"],
)
