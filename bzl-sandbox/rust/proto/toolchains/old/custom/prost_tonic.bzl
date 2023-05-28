"""Generates a rust library from .proto files using prost and tonic."""
load("@rules_rust//cargo:cargo_build_script.bzl", "cargo_build_script")
load("@rules_rust//rust:defs.bzl", "rust_library")

TONIC_PLUGIN = "@raze__protoc_gen_tonic__0_2_2//:cargo_bin_protoc_gen_tonic"
PROST_PLUGIN = "@raze__protoc_gen_prost__0_2_2//:cargo_bin_protoc_gen_prost"
PROST_CRATE_PLUGIN = "@raze__protoc_gen_prost_crate__0_3_0//:cargo_bin_protoc_gen_prost_crate"
PROTOC = "@com_google_protobuf//:protoc"
RUST_FMT = "@rules_rust//:rustfmt"
CARGO_TOML_TEMPLATE_PATH = "//bzl-sandbox/rust/proto/toolchains/old/custom:Cargo.toml.template"
MOD_RS_TEMPLATE_PATH = "//bzl-sandbox/rust/proto/toolchains/old/custom:mod.rs.template"
LIB_RS = "//bzl-sandbox/rust/proto/toolchains/old/custom:lib.rs"

# TODO: Find a way to expose the buf binary as a build target instead of using the local machines installation
# BUF_TARGET = "@rules_buf_toolchains//:buf_toolchain_impl"
DEFAULT_BUF_BIN = "/usr/local/bin/buf"

# buildifier: disable=function-docstring-args
def buf_gen_rust_proto(name, srcs, gen_yaml, buf_lock, buf_bin_path = DEFAULT_BUF_BIN):
    """Generates a tonic client and prost sources for input protos.

    Example Usage.

    load("//bzl-sandbox/rust/proto/toolchains/old/custom:prost_tonic.bzl", "buf_gen_rust_proto")
    buf_gen_rust_proto(
        name = "my_proto",
        srcs = ["path/to/my.proto"],
        gen_yaml = "//path/to/my:buf.gen.yaml",
        buf_lock = "//path/to/my:buf.lock",
        buf_bin_path = "/usr/local/bin/buf",
    )
    """
    if not buf_bin_path:
        buf_bin_path = DEFAULT_BUF_BIN

    cargo_build_script(
        name = "generate_" + name,
        srcs = [
            "//bzl-sandbox/rust/proto/toolchains/old/custom:build.rs",
        ],
        build_script_env = {
            "RUSTFMT": "$(execpath " + RUST_FMT + ")",
            "PROTOC": "$(execpath " + PROTOC + ")",
            "BUF_BIN_PATH": buf_bin_path,
            "PROST_PLUGIN_BIN": "$(execpath " + PROST_PLUGIN + ")",
            "TONIC_PLUGIN_BIN": "$(execpath " + TONIC_PLUGIN + ")",
            "PROST_CRATE_PLUGIN_BIN": "$(execpath " + PROST_CRATE_PLUGIN + ")",
            "GEN_YAML_FILE": "$(location " + gen_yaml + ")",
            "BUF_LOCK_FILE": "$(location " + buf_lock + ")",
            "CARGO_TOML_FILE": "$(location " + CARGO_TOML_TEMPLATE_PATH + ")",
            "MOD_RS_TEMPLATE": "$(location " + MOD_RS_TEMPLATE_PATH + ")",
        },
        data = [
            gen_yaml,
            buf_lock,
            MOD_RS_TEMPLATE_PATH,
            CARGO_TOML_TEMPLATE_PATH,
            TONIC_PLUGIN,
            PROST_PLUGIN,
            PROST_CRATE_PLUGIN,
            PROTOC,
            RUST_FMT,
        ] + srcs,
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
        name = name,
        srcs = [
            LIB_RS,
        ],
        visibility = ["//visibility:public"],
        deps = [
            ":generate_" + name,
            "//third_party/rust:prost",
            "//third_party/rust:prost_types",
            "//third_party/rust:tonic",
            "//third_party/rust:protoc_wkt",
        ],
    )
