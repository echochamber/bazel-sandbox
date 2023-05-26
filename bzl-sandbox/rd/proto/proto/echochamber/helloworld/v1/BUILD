load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto_grpc//grpc-gateway:defs.bzl", "gateway_grpc_library", "gateway_openapiv2_compile")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

proto_library(
    name = "greeter_proto",
    srcs = ["greeter.proto"],
    deps = [
        "@go_googleapis//google/api:annotations_proto",
    ],
)

gateway_openapiv2_compile(
    name = "greeter_openapiv2",
    protos = [":greeter_proto"],
)

gateway_grpc_library(
    name = "gateway",
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1/gateway",
    options = {
        "@rules_proto_grpc//grpc-gateway:grpc_gateway_plugin": [
            "paths=source_relative",
            "omit_package_doc=1",
        ],
    },
    protos = [":greeter_proto"],
)

go_proto_library(
    name = "v1_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1",
    proto = ":greeter_proto",
    deps = ["@go_googleapis//google/api:annotations_go_proto"],
)

go_library(
    name = "helloworld",
    embed = [
        ":v1_go_proto",
    ],
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1",
)

exports_files(glob([
    "*.proto",
]))
