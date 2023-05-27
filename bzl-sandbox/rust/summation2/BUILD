load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
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
)

buf_lint_test(
    name = "src_proto_sum2_proto_lint",
    targets = [":src_proto_sum2_proto"],
)

exports_files([
    "buf.yaml",
    "buf.lock",
])

go_proto_library(
    name = "sum2_go_proto",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/echochamber/rdprotos/echochamber/src/proto/sum2",
    proto = ":src_proto_sum2_proto",
)

go_library(
    name = "sum2",
    embed = [":sum2_go_proto"],
    importpath = "github.com/echochamber/rdprotos/echochamber/src/proto/sum2",
)

buf_lint_test(
    name = "sum2_proto_lint",
    config = "//bzl-sandbox/rust/summation2:buf.yaml",
    targets = [":sum2_proto"],
)
