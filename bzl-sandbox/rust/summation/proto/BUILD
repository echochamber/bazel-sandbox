load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_buf//buf:defs.bzl", "buf_lint_test")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_rust//cargo:cargo_build_script.bzl", "cargo_build_script")
load("@rules_rust//rust:defs.bzl", "rust_library")

package(default_visibility = ["//bzl-sandbox/rust/summation:internal"])

proto_library(
    name = "proto",
    srcs = [
        "summation.proto",
    ],
    visibility = ["//visibility:public"],
)

# Runs a cargo build script
cargo_build_script(
    name = "generate_rust_proto",
    srcs = [
        "build.rs",
    ],
    build_script_env = {
        "RUSTFMT": "$(execpath @rules_rust//:rustfmt)",
        "PROTOC": "$(execpath @com_google_protobuf//:protoc)",
    },
    data = [
        "summation.proto",
        "@com_google_protobuf//:protoc",
        "@rules_rust//:rustfmt",
    ],
    deps = [
        "//third_party/rust:tonic_build",
    ],
)

genrule(
    name = "concat_all_files",
    srcs = [
        ":src_proto_summation",
    ],
    outs = ["concatenated.txt"],
    cmd = "cat $(locations :src_proto_summation) > $@",
)

# Defines a rust library using the outputs from build.rs
rust_library(
    name = "src_proto_summation",
    srcs = [
        "lib.rs",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":generate_rust_proto",
        "//third_party/rust:prost",
        "//third_party/rust:tonic",
    ],
)

buf_lint_test(
    name = "src_proto_summation_proto_lint",
    targets = [":src_proto_summation_proto"],
)

go_proto_library(
    name = "src_proto_summation_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rust/summation/proto",
    proto = ":proto",
)
