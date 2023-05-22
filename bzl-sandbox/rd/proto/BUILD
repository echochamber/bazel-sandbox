load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_rust//rust:defs.bzl", "rust_binary")
load("//bzl-sandbox/rust/proto/toolchains/custom:prost_tonic.bzl", "prost_tonic_rust_lib")

package(default_visibility = ["//bzl-sandbox/rd:internal"])
prost_tonic_rust_lib(
    name = "helloworld_rust_proto",
    srcs = ["//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter.proto"],
    gen_yaml = "//bzl-sandbox/rd/proto:buf.gen.yaml",
    proto_root_dir = "proto/echochamber/helloworld/v1",
)

rust_binary(
    name = "manual_test",
    srcs = ["src/main.rs"],
    deps = [
        ":helloworld_rust_proto",
    ],
)


# srcs = ["@buf_deps_bzl-sandbox_rust_summation2//google/api:annotations.proto"]


# prost_tonic_rust_lib(
#     name = "v1",
#     srcs = ["//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter.proto"],
#     gen_yaml = "//bzl-sandbox/rd/proto:buf.gen.yaml",
#     proto_root_dir = "proto/echochamber/helloworld/v1"
# )

# extern_path

exports_files([
    "buf.yaml",
    "buf.lock",
])

_GO_PLUGINS = [
    "@org_golang_google_grpc_cmd_protoc_gen_go_grpc//:protoc-gen-go-grpc"
]