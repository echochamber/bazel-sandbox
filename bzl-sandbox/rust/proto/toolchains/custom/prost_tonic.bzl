load("@rules_rust//cargo:cargo_build_script.bzl", "cargo_build_script")
load("@rules_rust//rust:defs.bzl", "rust_library")

TONIC_PLUGIN_TARGET = "@raze__protoc_gen_tonic__0_2_2//:cargo_bin_protoc_gen_tonic"
PROST_PLUGIN_TARGET = "@raze__protoc_gen_prost__0_2_2//:cargo_bin_protoc_gen_prost"
PROST_CRATE_PLUGIN_TARGET = "@raze__protoc_gen_prost_crate__0_3_0//:cargo_bin_protoc_gen_prost_crate"
PROTOC_TARGET = "@com_google_protobuf//:protoc"
CARGO_TOML_TEMPLATE_PATH = "//bzl-sandbox/rust/proto/toolchains/custom:Cargo.toml.template"
MOD_RS_TEMPLATE_PATH = "//bzl-sandbox/rust/proto/toolchains/custom:mod.rs.template"
LIB_RS = "//bzl-sandbox/rust/proto/toolchains/custom:lib.rs"
# TODO: Find a way to expose the buf binary as a build target instead of using the local machines installation
# BUF_TARGET = "@rules_buf_toolchains//:buf_toolchain_impl"


def prost_tonic_rust_lib(name, srcs, gen_yaml):
    """Generates a tonic client and prost sources for input protos.

    Example Usage.

    prost_tonic_rust_lib(
        name = "my_proto",
        srcs = ["path/to/my.proto],
        gen_yaml = "//path/to/my/buf.gen.yaml"
    )
    """
    # Runs a cargo build script
    cargo_build_script(
        name = "generate_" + name,
        srcs = [
            "//bzl-sandbox/rust/proto/toolchains/custom:build.rs",
        ],
        build_script_env = {
            "RUSTFMT": "$(execpath @rules_rust//:rustfmt)",
            "PROTOC": "$(execpath " + PROTOC_TARGET + ")",
            "CARGO": "/home/jason/.cargo/bin/cargo",
            "BUF_BIN_PATH": "/usr/local/bin/buf",
            "PROST_PLUGIN_BIN": "$(execpath " + PROST_PLUGIN_TARGET + ")",
            "TONIC_PLUGIN_BIN": "$(execpath " + TONIC_PLUGIN_TARGET + ")",
            "PROST_CRATE_PLUGIN_BIN": "$(execpath " + PROST_CRATE_PLUGIN_TARGET + ")",
            "GEN_YAML_FILE": "$(location " + gen_yaml + ")",
            "CARGO_TOML_FILE": "$(location " + CARGO_TOML_TEMPLATE_PATH + ")",
            "MOD_RS_TEMPLATE": "$(location " + MOD_RS_TEMPLATE_PATH + ")",

        },
        data = [
            MOD_RS_TEMPLATE_PATH,
            CARGO_TOML_TEMPLATE_PATH,
            TONIC_PLUGIN_TARGET,
            PROST_PLUGIN_TARGET,
            PROST_CRATE_PLUGIN_TARGET,
            PROTOC_TARGET,
            "@rules_rust//:rustfmt",
            # buf lock intentionally ommited because it causes name colissions for imported proto types (not sure why).
            # "buf.lock",
            gen_yaml
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
        name = name + "_rust",
        srcs = [
            LIB_RS
        ],
        visibility = ["//visibility:public"],
        deps = [
            ":generate_" + name,
            "//third_party/rust:prost",
            "//third_party/rust:tonic",
        ],
    )
