load("@rules_rust//rust:defs.bzl", "rust_binary")

package(default_visibility = ["//bzl-sandbox/rust/summation:internal"])

rust_binary(
    name = "server_bin",
    srcs = [
        "main.rs",
        "my_summation.rs",
    ],
    deps = [
        "//bzl-sandbox/rust/summation/proto:src_proto_summation",
        "//bzl-sandbox/rust/summation/lib:src_summation",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:futures",
        "//third_party/rust:to_unit",
    ],
)