load("@rules_rust//rust:defs.bzl", "rust_binary")
load("//bzl-sandbox/rust/proto/toolchains/custom:prost_tonic.bzl", "buf_gen_rust_proto")
load("@rules_proto_grpc//grpc-gateway:defs.bzl", "gateway_grpc_compile", "gateway_grpc_library")
load("@rules_proto//proto:defs.bzl", "proto_library")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

buf_gen_rust_proto(
    name = "helloworld_rust_proto",
    srcs = ["//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter.proto"],
    buf_lock = "//bzl-sandbox/rd/proto:buf.lock",
    gen_yaml = "//bzl-sandbox/rd/proto:buf.gen.yaml",
)

rust_binary(
    name = "manual_test",
    srcs = ["src/main.rs"],
    deps = [
        ":helloworld_rust_proto",
    ],
)

gateway_grpc_library(
    name = "greeter_gateway_grpc",
    importpath = "github.com/echochamber/rdprotos/gen/go/echochamber/helloworld/v1",
    protos = ["//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter_proto"],
    deps = [
        "@com_github_golang_protobuf//descriptor:go_default_library",  # keep
        "@com_github_golang_protobuf//ptypes/struct:go_default_library",  # keep
    ],
)

# gateway_grpc_compile(
#     name = "greeter_gateway_grpc",

# )
