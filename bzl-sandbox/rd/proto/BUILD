load("@rules_rust//rust:defs.bzl", "rust_binary")
load("//bzl-sandbox/rust/proto/toolchains/custom:prost_tonic.bzl", "buf_gen_rust_proto")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

buf_gen_rust_proto(
    name = "helloworld_rust_proto",
    srcs = ["//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter.proto"],
    buf_lock = "//bzl-sandbox/rd/proto:buf.lock",
    gen_yaml = "//bzl-sandbox/rd/proto:buf.gen.yaml",
)

rust_binary(
    name = "manual_test",
    srcs = ["src/main.rs"],
    deps = [
        ":helloworld_rust_proto",
    ],
)
