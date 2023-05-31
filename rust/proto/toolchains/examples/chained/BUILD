load("//rust/proto/toolchains:plugin.bzl", "prost_library", "tonic_library")
load("@rules_rust//rust:defs.bzl", "rust_binary")

package(default_visibility = ["//visibility:public"])


# chained/_third_tonic_rs_tonic_rs/protos.thirdpackage.tonic.rs
rust_binary(
    name = "main",
    srcs = ["main.rs"],
    deps = [
        "//rust/proto/toolchains/examples/chained/protos/thirdpackage:third_prost_rs",
        "//rust/proto/toolchains/examples/chained/protos/thirdpackage:third_tonic_rs",
        "//rust/proto/common:googleapi_rs",
        "//third_party/rust:protoc_wkt",
    ],
)
