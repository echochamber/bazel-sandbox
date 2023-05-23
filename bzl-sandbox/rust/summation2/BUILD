load("@rules_buf//buf:defs.bzl", "buf_lint_test")
load("@rules_proto//proto:defs.bzl", "proto_library")
load("//bzl-sandbox/rust/proto/toolchains/custom:prost_tonic.bzl", "buf_gen_rust_proto")

package(default_visibility = ["//visibility:public"])

buf_gen_rust_proto(
    name = "summation2",
    srcs = ["summation2.proto"],
    gen_yaml = "//bzl-sandbox/rust/summation2:buf.gen.yaml",
)

proto_library(
    name = "src_proto_sum2_proto",
    srcs = ["summation2.proto"],
    strip_import_prefix = "/bzl-sandbox/rust/summation2",
)

buf_lint_test(
    name = "src_proto_sum2_proto_lint",
    config = "//bzl-sandbox/rust/summation2:buf.yaml",
    targets = [":src_proto_sum2_proto"],
)

exports_files([
    "buf.yaml",
    "buf.lock",
])
