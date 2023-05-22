load("@rules_proto//proto:defs.bzl", "proto_library")
load("@rules_rust//cargo:cargo_build_script.bzl", "cargo_build_script")
load("@rules_rust//rust:defs.bzl", "rust_library")
load("@rules_rust//proto:proto.bzl", "rust_proto_library")

package(default_visibility = ["//bzl-sandbox/rust/summation2:internal"])

# proto_library(
#     name = "proto",
#     srcs = [
#         "summation2.proto",
#     ],
#     visibility = ["//visibility:public"],
#     deps = [
#         "@go_googleapis//google/api:annotations_proto",
#     ],
# )

TONIC_PLUGIN_TARGET = "@raze__protoc_gen_tonic__0_2_2//:cargo_bin_protoc_gen_tonic"
PROST_PLUGIN_TARGET = "@raze__protoc_gen_prost__0_2_2//:cargo_bin_protoc_gen_prost"
PROST_CRATE_PLUGIN_TARGET = "@raze__protoc_gen_prost_crate__0_3_0//:cargo_bin_protoc_gen_prost_crate"
PROTOC_TARGET = "@com_google_protobuf//:protoc"
# TODO: Find a way to expose the buf binary as a build target instead of using the local machines installation
# BUF_TARGET = "@rules_buf_toolchains//:buf_toolchain_impl"

# Runs a cargo build script
cargo_build_script(
    name = "generate_rust_proto",
    srcs = [
        "build.rs",
    ],
    build_script_env = {
        "RUSTFMT": "$(execpath @rules_rust//:rustfmt)",
        "PROTOC": "$(execpath " + PROTOC_TARGET + ")",
        "CARGO": "/home/jason/.cargo/bin/cargo",
        "BUF_BIN_PATH": "/usr/local/bin/buf",
        "PROST_PLUGIN_BIN": "$(execpath " + PROST_PLUGIN_TARGET + ")",
        "TONIC_PLUGIN_BIN": "$(execpath " + TONIC_PLUGIN_TARGET + ")",
        "PROST_CRATE_PLUGIN_BIN": "$(execpath " + PROST_CRATE_PLUGIN_TARGET + ")",
        "GEN_YAML_FILE": "$(location :buf.gen.yaml)",
        "CARGO_TOML_FILE": "$(location :Cargo.toml)",
        "MOD_RS_TEMPLATE": "$(location :mod.rs.template)",
        
    },
    data = [
        "mod.rs.template",
        "Cargo.toml",
        "summation2.proto",
        "@rules_rust//:rustfmt",
        TONIC_PLUGIN_TARGET,
        PROST_PLUGIN_TARGET,
        PROST_CRATE_PLUGIN_TARGET,
        PROTOC_TARGET,
        # "buf.lock",
    ] + glob(["*.yaml"]),
    proc_macro_deps = [
        "//third_party/rust:serde_derive",
    ],
    deps = [
        "//third_party/rust:prost_build",
        "//third_party/rust:serde",
        "//third_party/rust:serde_yaml",
        "//third_party/rust:tonic_build",
    ],
)

# Defines a rust library using the outputs from build.rs
rust_library(
    name = "src_proto_summation2",
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
