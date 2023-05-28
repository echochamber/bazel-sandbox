load("@rules_proto_grpc//:defs.bzl", "proto_plugin")

package(default_visibility = ["//visibility:public"])


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
)