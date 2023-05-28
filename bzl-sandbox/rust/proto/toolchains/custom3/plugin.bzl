load(
    "@rules_proto_grpc//:defs.bzl",
    "ProtoPluginInfo",
    "proto_compile_attrs",
    "proto_compile_impl",
)
load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library")
load("@bazel_skylib//rules:expand_template.bzl", "expand_template")
load("@bazel_skylib//rules:select_file.bzl", "select_file")


prost_proto = rule(
    implementation = proto_compile_impl,
    attrs = dict(
        proto_compile_attrs,
        _plugins = attr.label_list(
            providers = [ProtoPluginInfo],
            default = [
                Label("//bzl-sandbox/rust/proto/toolchains/custom3:prost_proto_plugin"),
            ],
            doc = "Prost Proto Plugin",
        ),
    ),
    toolchains = [str(Label("@rules_proto_grpc//protobuf:toolchain_type"))],
)

prost_tonic = rule(
    implementation = proto_compile_impl,
    attrs = dict(
        proto_compile_attrs,
        _plugins = attr.label_list(
            providers = [ProtoPluginInfo],
            default = [
                Label("//bzl-sandbox/rust/proto/toolchains/custom3:prost_tonic_plugin"),
            ],
            doc = "Prost Tonic Plugin",
        ),
    ),
    toolchains = [str(Label("@rules_proto_grpc//protobuf:toolchain_type"))],
)

prost_crate = rule(
    implementation = proto_compile_impl,
    attrs = dict(
        proto_compile_attrs,
        _plugins = attr.label_list(
            providers = [ProtoPluginInfo],
            default = [
                Label("//bzl-sandbox/rust/proto/toolchains/custom3:prost_crate_plugin"),
            ],
            doc = "Prost Crate Plugin",
        ),
    ),
    toolchains = [str(Label("@rules_proto_grpc//protobuf:toolchain_type"))],
)


def tonic_rust_library(
    name,
    protos,
    grpc_service_packages, # Packages with a GRPC service to include in the generated lib.rs file.
    externs=None,
    google_apis_annotations_proto="@go_googleapis//google/api:annotations_proto"
):
    if not externs:
        externs=[
            ".google.api=::google::api",
        ]
    externs = ["extern_path={}".format(e) for e in externs]
        
    prost_name = "_" + name + "_prost_rs"
    prost_proto(
        name = prost_name,
        options = {
            "*": [
                "file_descriptor_set",
            ],
        },
        protos = [google_apis_annotations_proto] + protos,
        visibility = ["//visibility:public"],
    )

    tonic_name = "_" + name + "_tonic_rs"
    crate_name = "_" + name + "_crate_rs"
    mod_rs_name = "_" + name + "_mod_rs"
    mod_name = "_" + name + "_lib_mod_rs"

    prost_tonic(
        name = tonic_name,
        options = {
            "*": [
                "extern_path=.=::" + mod_name,
            ] + externs,
        },
        protos = protos,
        visibility = ["//visibility:public"],
    )
    prost_crate(
        name = crate_name,
        protos = [google_apis_annotations_proto] + protos
    )
    # Hackyway to fix the fact that the mod.rs file isn't importing from a genfiles dir.
    select_file(
        name = mod_rs_name,
        srcs = ":" + crate_name,
        subpath = "mod.rs",
    )
    expand_template(
        name = "mod_rs",
        out = "mod.rs",
        substitutions = {
            "include!(\"": "include!(concat!(env!(\"PROTO_IMPORT_PATH\"), \"/",
            "\");": "\"));",
        },
        template = ":" + mod_rs_name
    )
    rust_library(
        name = mod_name,
        srcs = [
            ":mod.rs",
        ],
        compile_data = [
            ":" + prost_name,
            ":" + tonic_name,
        ],
        rustc_env = {
            "PROTO_IMPORT_PATH": "$(location :" + prost_name + ")",
        },
        deps = [
            "//third_party/rust:prost",
            "//third_party/rust:prost_types",
        ],
    )
    tonic_includes = "\n".join([
        """include!(concat!(env!("TONIC_PATH"), "/{}.tonic.rs"));""".format(p) for p in grpc_service_packages
    ])
    lib_rs_file = "_" + name + "_lib_rs_file"
    expand_template(
        name = lib_rs_file,
        out = "lib.rs",
        substitutions = {
            "{mod_name}": mod_name,
            "{tonic_includes}": tonic_includes,
        },
        template = "//bzl-sandbox/rust/proto/toolchains/custom3:lib.rs.template"
    )
    rust_library(
        name = name,
        srcs = [
            ":" + lib_rs_file,
        ],
        compile_data = [
            ":" + tonic_name,
        ],
        rustc_env = {
            "TONIC_PATH": "$(location :" + tonic_name + ")",
        },
        deps = [
            ":" + mod_name,
            "//third_party/rust:prost",
            "//third_party/rust:prost_types",
            "//third_party/rust:tonic",
        ],
    )