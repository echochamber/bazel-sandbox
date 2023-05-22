load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_rust//proto:toolchain.bzl", "rust_proto_toolchain")
load("@rules_rust//proto:proto.bzl", "rust_proto_library")
load("@rules_rust//rust:defs.bzl", "rust_binary")

package(default_visibility = ["//visibility:public"])

# rust_proto_toolchain(
#     name = "rust_prost_proto_impl",
#     edition = "2021",
#     # TODO: haven't tested building a rust grpc library yet, may need other deps
#     grpc_compile_deps = [
#         "//third_party/rust:tonic",
#     ],
#     # Protobuf compiler plugin to generate rust gRPC stubs.
#     grpc_plugin = "@raze__protoc_gen_tonic__0_2_2//:cargo_bin_protoc_gen_tonic",
#     proto_compile_deps = [
#         "//third_party/rust:prost",
#         "//third_party/rust:prost_types",
#         "//third_party/rust:protobuf",
#     ],
#     # Protobuf compiler plugin to generate rust protobuf stubs.
#     proto_plugin = "@raze__protoc_gen_prost__0_2_2//:cargo_bin_protoc_gen_prost",
#     # Path to the protobuf compiler.
#     protoc = "@com_google_protobuf//:protoc",
# )

# toolchain(
#     name = "rust_prost_proto",
#     toolchain = ":rust_prost_proto_impl",
#     toolchain_type = "@rules_rust//proto:toolchain_type",
# )

proto_library(
    name = "simple_proto",
    srcs = ["simple.proto"],
)

rust_proto_library(
    name = "simple_proto_rust",
    expected_outs = [
        "simple",
    ],
    deps = [":simple_proto"],
)

rust_binary(
    name = "simple_proto_rust_binary",
    srcs = ["simple_proto_binary.rs"],
    deps = [":simple_proto_rust"],
)
