load("@rules_proto//proto:defs.bzl", "proto_library")
load("//bzl-sandbox/rust/proto/toolchains:plugin.bzl", "tonic_library", "prost_library")
load("@rules_rust//rust:defs.bzl", "rust_binary")

proto_library(
    name = "annotated_proto",
    srcs = ["annotated.proto"],
    deps = [
        "@com_github_grpc_ecosystem_grpc_gateway_v2//protoc-gen-openapiv2/options:options_proto",
        "@com_google_protobuf//:descriptor_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
)


prost_library(
  name = "annotated_rs",
  protos = [
    ":annotated_proto",
  ],
  externs = {
    ".google.api": "::googleapi_rs::google::api",
  },
  deps = [
    "//bzl-sandbox/rust/proto/common:googleapi_rs"
  ]
)

tonic_library(
    name = "annotated_tonic_rs",
    service_package = "path.to.my.proto.v1",
    service_proto = ":annotated_proto",
    externs = {
      ".": "::annotated_rs"
    },
    deps = [
      ":annotated_rs",
    ]
)

rust_binary(
    name = "main",
    srcs = ["src/main.rs"],
    deps = [
        ":annotated_tonic_rs",
        ":annotated_rs",
        "//bzl-sandbox/rust/proto/common:googleapi_rs",
        "//third_party/rust:env_logger",
        "//third_party/rust:log",
        "//third_party/rust:protoc_wkt",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:tonic_reflection",
    ],
)