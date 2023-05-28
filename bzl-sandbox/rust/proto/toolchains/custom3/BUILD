load("@rules_proto//proto:defs.bzl", "proto_library")
load(":plugin.bzl", "prost_crate", "prost_proto", "prost_tonic")
load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library")
load("@rules_proto_grpc//:defs.bzl", "proto_plugin")
load("@bazel_skylib//rules:expand_template.bzl", "expand_template")
load("@bazel_skylib//rules:select_file.bzl", "select_file")

proto_plugin(
    name = "prost_proto_plugin",
    options = [
        # "compile_well_known_types",
    ],
    output_directory = True,
    separate_options_flag = True,
    tool = "@raze__protoc_gen_prost__0_2_2//:cargo_bin_protoc_gen_prost",
)

proto_plugin(
    name = "prost_tonic_plugin",
    options = [
        # The approach described by rules_proto_grpc doesn't allow multiple plugins to be run in the same protoc invocation,
        # SO we need to set no_include:
        # https://rules-proto-grpc.com/en/latest/custom_plugins.html
        # https://github.com/neoeinstein/protoc-gen-prost/tree/main/protoc-gen-tonic#usage-with-protoc-and-protoc-gen-prost
        "no_include",
    ],
    output_directory = True,
    separate_options_flag = True,
    tool = "@raze__protoc_gen_tonic__0_2_2//:cargo_bin_protoc_gen_tonic",
)

proto_plugin(
    name = "prost_crate_plugin",
    out = "mod.rs",
    options = [
        "no_features",
    ],
    quirks = ["QUIRK_OUT_PASS_ROOT"],
    separate_options_flag = True,
    tool = "@raze__protoc_gen_prost_crate__0_3_0//:cargo_bin_protoc_gen_prost_crate",
    # output_directory = True,
)

proto_library(
    name = "simple_proto",
    srcs = ["simple.proto"],
    deps = [],
)

proto_library(
    name = "annotated_proto",
    srcs = ["annotated.proto"],
    deps = [
        "@com_github_grpc_ecosystem_grpc_gateway_v2//protoc-gen-openapiv2/options:options_proto",
        "@com_google_protobuf//:descriptor_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
)

prost_proto(
    name = "all_prost_rs",
    options = {
        "*": [
          "file_descriptor_set",
            # "extern_path=.google.api=self",
        ],
    },
    protos = [
        "annotated_proto",
        "simple_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
    visibility = ["//visibility:public"],
)

prost_tonic(
    name = "all_tonic_rs",
    options = {
        "*": [
            "extern_path=.google.api=::google::api",
            "extern_path=.=::prost_protos_mod",
        ],
    },
    protos = [
        "annotated_proto",
        "simple_proto",
    ],
    visibility = ["//visibility:public"],
)

prost_crate(
    name = "all_crate_rs",
    # verbose = 3,
    extra_protoc_files = [
        ":Cargo.toml.template",
    ],
    protos = [
        "annotated_proto",
        "simple_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
    visibility = ["//visibility:public"],
)

# Hackyway to fix the fact that the mod.rs file isn't importing from a genfiles dir.
select_file(
    name = "mod_rs",
    srcs = ":all_crate_rs",
    subpath = "mod.rs",
)
expand_template(
    name = "prepend_import_file",
    out = "mod.rs",
    substitutions = {
        "include!(\"": "include!(concat!(env!(\"PROTO_IMPORT_PATH\"), \"/",
        "\");": "\"));",
    },
    template = ":mod_rs",
)

rust_library(
    name = "prost_protos_mod",
    srcs = [
        ":mod.rs",
    ],
    compile_data = [
        ":all_prost_rs",
        ":all_tonic_rs",
    ],
    rustc_env = {
        "PROTO_IMPORT_PATH": "$(location :all_prost_rs)",
    },
    deps = [
        "//third_party/rust:prost",
        "//third_party/rust:prost_types",
    ],
)

rust_library(
    name = "lib_rs",
    srcs = [
        "src/lib.rs"
    ],
    compile_data = [
        ":all_tonic_rs",
    ],
    rustc_env = {
        "TONIC_PATH": "$(location :all_tonic_rs)",
    },
    deps = [
        ":prost_protos_mod",
        "//third_party/rust:prost",
        "//third_party/rust:prost_types",
        "//third_party/rust:tonic",
    ],
)

rust_binary(
    name = "main",
    srcs = ["src/main.rs"],
    deps = [
        ":lib_rs",
        "//third_party/rust:bytes",
        "//third_party/rust:dotenv",
        "//third_party/rust:env_logger",
        "//third_party/rust:futures",
        "//third_party/rust:log",
        "//third_party/rust:prost",
        "//third_party/rust:prost_types",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:tonic_reflection",
        "//third_party/rust:uuid",
        "//third_party/rust:protoc_wkt",
    ],
)
