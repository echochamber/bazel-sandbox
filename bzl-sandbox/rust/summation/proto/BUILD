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
    deps = [
        "//third_party/rust:tonic_build",
    ],
    build_script_env = {
        "RUSTFMT": "$(execpath @rules_rust//:rustfmt)",
        "PROTOC": "$(execpath @com_google_protobuf//:protoc)"
    },
    data = [
        "summation.proto",
        "@rules_rust//:rustfmt",
        "@com_google_protobuf//:protoc",
    ],
)
genrule(
    name = "concat_all_files",
    srcs = [
        ":src_proto_summation"
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
    deps = [
        ":generate_rust_proto",
        "//third_party/rust:prost",
        "//third_party/rust:tonic",
    ],
    visibility = ["//visibility:public"],
)