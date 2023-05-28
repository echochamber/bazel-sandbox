load("@rules_proto//proto:defs.bzl", "proto_library")
load("//bzl-sandbox/rust/proto/toolchains/custom3:plugin.bzl", "tonic_rust_library")
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

tonic_rust_library(
    name = "annotated_rs",
    grpc_service_packages = ["path.to.my.proto.v1"],
    protos = [
        ":annotated_proto",
    ],
    google_apis_annotations_proto = "@go_googleapis//google/api:annotations_proto"
)

rust_binary(
    name = "main",
    srcs = ["src/main.rs"],
    deps = [
        ":annotated_rs",
        "//third_party/rust:env_logger",
        "//third_party/rust:log",
        "//third_party/rust:protoc_wkt",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:tonic_reflection",
    ],
)