"""Macros wrap prost/tonic rules for generating rust_library targets from proto_library targets for prost/tonic."""

load(
    "@rules_proto_grpc//:defs.bzl",
    "ProtoPluginInfo",
    "proto_compile_attrs",
    "proto_compile_impl",
)
load("@rules_rust//rust:defs.bzl", "rust_library")
load("@bazel_skylib//rules:expand_template.bzl", "expand_template")
load("@bazel_skylib//rules:write_file.bzl", "write_file")
load("@bazel_skylib//rules:select_file.bzl", "select_file")

prost_proto = rule(
    implementation = proto_compile_impl,
    attrs = dict(
        proto_compile_attrs,
        _plugins = attr.label_list(
            providers = [ProtoPluginInfo],
            default = [
                Label("//rust/proto/toolchains:prost_proto_plugin"),
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
                Label("//rust/proto/toolchains:prost_tonic_plugin"),
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
                Label("//rust/proto/toolchains:prost_crate_plugin"),
            ],
            doc = "Prost Crate Plugin",
        ),
    ),
    toolchains = [str(Label("@rules_proto_grpc//protobuf:toolchain_type"))],
)

def prost_library(
        name,
        protos,
        externs = None,
        deps = None,
        file_descriptor_set = True,
        prost = "//third_party/rust:prost",
        prost_types = "//third_party/rust:prost_types"):
    """Wraps generating a rust_library using https://github.com/neoeinstein/protoc-gen-prost.

    For more info on how some of these fields are used:
    https://docs.rs/prost-build/latest/prost_build/struct.Config.html
    https://github.com/neoeinstein/protoc-gen-prost

    Args:
        name: The name of the rust_library that will contain the provided protos.
        protos: List of proto_library targets to build rust protos for.
        externs: Dictionary mapping .proto.path. to ::rust::module::path in a external rust library provided via deps.
          This includes other prost_library targets that our protos depend upon.
        deps: Dependencies for out final rust_library. This should include libraries providing anything you mapped
          in externs.
        file_descriptor_set: Whether or not to include the file descriptor set in the generated rust file.
        prost: Target for the prost crate.
        prost_types: Target for the prost_types crate.
    """

    if not externs:
        externs = {}
    externs = ["extern_path={}={}".format(e, externs[e]) for e in externs]
    if not deps:
        deps = []

    # Protect against duplicates in case user provided prost in deps and not in prost attribute.
    deps_all = [
        prost,
        prost_types,
    ]
    for dep in deps:
        if dep not in deps_all:
            deps_all.append(dep)

    prost_name = "_" + name + "_prost_rs"
    crate_name = "_" + name + "_crate_rs"
    base_mod_rs_name = "_base_" + name + "_mod_rs"
    final_mod_rs_name = "_" + name + "_mod_rs"
    final_mod_rs_file = "_" + name + "_mod.rs"

    options = []
    if file_descriptor_set:
        options.append("file_descriptor_set")
    options = options + externs
    prost_proto(
        name = prost_name,
        options = {
            "*": options,
        },
        protos = protos,
        visibility = ["//visibility:public"],
    )
    prost_crate(
        name = crate_name,
        options = {},
        protos = protos,
    )

    # Hacky way to allow bazel to use $(location) to provide the path of the generated files to mod.rs.
    select_file(
        name = base_mod_rs_name,
        srcs = ":" + crate_name,
        subpath = "mod.rs",
    )
    expand_template(
        name = final_mod_rs_name,
        out = final_mod_rs_file,
        substitutions = {
            "include!(\"": "include!(concat!(env!(\"PROTO_IMPORT_PATH\"), \"/",
            "\");": "\"));",
        },
        template = ":" + base_mod_rs_name,
    )
    rust_library(
        name = name,
        srcs = [
            ":" + final_mod_rs_name,
        ],
        crate_root = final_mod_rs_file,
        compile_data = [
            ":" + prost_name,
        ],
        rustc_env = {
            "PROTO_IMPORT_PATH": "$(location :" + prost_name + ")",
        },
        deps = deps_all,
    )

def tonic_library(
        name,
        proto,
        proto_package,
        prost_proto,
        prost_crate = "//third_party/rust:prost",
        prost_types_crate = "//third_party/rust:prost_types",
        tonic_crate = "//third_party/rust:tonic"):
    """Wraps generating a rust_library using https://github.com/neoeinstein/protoc-gen-prost tonic plugin.

    For more info on how some of these fields are used:
    https://docs.rs/prost-build/latest/prost_build/struct.Config.html
    https://github.com/neoeinstein/protoc-gen-prost

    Args:
        name: The name of the rust_library that will contain the provided protos.
        proto: Proto file to generate a grpc service for using tonic.
        proto_package: the.proto.package the service is in.
        prost_proto: prost_library target that contains the message request/response types used by this service.
        prost_crate: Target for the prost crate.
        prost_types_crate: Target for the prost_types crate.
        tonic_crate: Target for the tonic crate.
    """

    

    service_crate_name = prost_proto.split(":")[-1]

    externs = {
        ".": "::" + service_crate_name
    }
    externs = ["extern_path={}={}".format(e, externs[e]) for e in externs]

    # Protect against duplicates in case user provided prost in deps and not in prost attribute.
    deps = [
        prost_crate,
        prost_types_crate,
        tonic_crate,
        prost_proto,
    ]
    tonic_name = "_" + name + "_tonic_rs"
    prost_tonic(
        name = tonic_name,
        options = {
            "*": externs,
        },
        protos = [proto],
    )
    tonic_includes = """include!(concat!(env!("TONIC_PATH"), "/{}.tonic.rs"));\n""".format(proto_package)
    tonic_lib_rs = "_" + name + "_lib_rs"
    tonic_lib_rs_file = "_" + name + "_lib.rs"
    write_file(
        name = tonic_lib_rs,
        out = tonic_lib_rs_file,
        content = [tonic_includes],
    )
    rust_library(
        name = name,
        srcs = [
            ":" + tonic_lib_rs,
        ],
        compile_data = [
            ":" + tonic_name,
        ],
        rustc_env = {
            "TONIC_PATH": "$(location :" + tonic_name + ")",
        },
        deps = deps,
    )
