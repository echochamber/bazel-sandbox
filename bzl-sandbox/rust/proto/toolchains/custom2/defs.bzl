load("@rules_rust//cargo:cargo_build_script.bzl", "cargo_build_script")
load("@rules_rust//rust:defs.bzl", "rust_library")

# buildifier: disable=function-docstring-args
def buf_gen_rust_proto(
        name,
        srcs,  # proto_lib targets
        deps):  # Must include all deps, not just direct deps, limitation of being a macro and not a rule.
    """Generates prost protos from sources"""
    proto_fds_files = ",".join(["$(location {})".format(p) for p in srcs])
    proto_deps_files = ",".join(["$(location {})".format(p) for p in deps])
    proto_fds_files = "{},{}".format(proto_fds_files, proto_deps_files)

    envstuff = {
        "RUSTFMT": "$(execpath @rules_rust//:rustfmt)",
        "PROTOC": "$(execpath @com_google_protobuf//:protoc)",
        # TODO: Handle multiple
        "FILE_DESCRIPTOR_SETS": proto_fds_files,
    }

    # Runs a cargo build script
    cargo_build_script(
        name = name + "_gen",
        srcs = [
            "build.rs",
        ],
        build_script_env = envstuff,
        rustc_env = envstuff,
        data = [
            "@com_google_protobuf//:protoc",
            "@rules_rust//:rustfmt",
        ] + srcs + deps,
        deps = [
            "//third_party/rust:tonic_build",
            "//third_party/rust:prost_build",
            "//third_party/rust:prost_types",
            "//third_party/rust:prost",
        ],
        proc_macro_deps = [
            "//third_party/rust:serde_derive",
            "//third_party/rust:prost_derive",
        ],
    )
    rust_library(
        name = name,
        srcs = [
            "lib.rs",
        ],
        visibility = ["//visibility:public"],
        deps = [
            name + "_gen",
            "//third_party/rust:prost",
            "//third_party/rust:prost_types",
            "//third_party/rust:tonic",
        ],
    )
