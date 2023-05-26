load("@rules_buf//buf:defs.bzl", "buf_lint_test")
load("@rules_proto//proto:defs.bzl", "proto_library")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

proto_library(
    name = "greeter_proto",
    srcs = ["greeter.proto"],
    deps = [
        "@com_google_protobuf//:descriptor_proto",  # keep
        "@com_google_protobuf//:struct_proto", # Keep
        "@go_googleapis//google/api:annotations_proto",
    ],
)

exports_files(glob([
    "*.proto",
]))
