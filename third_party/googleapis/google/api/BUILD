load("@rules_buf//buf:defs.bzl", "buf_lint_test")
load("@io_bazel_rules_go//go:def.bzl", "go_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_proto//proto:defs.bzl", "proto_library")

# This is an API workspace, having public visibility by default makes perfect sense.
package(default_visibility = ["//visibility:public"])

##############################################################################
# Common
##############################################################################
proto_library(
    name = "annotations_proto",
    srcs = [
        "annotations.proto",
        "http.proto",
    ],
    deps = [
        "@com_google_protobuf//:descriptor_proto",
        "@go_googleapis//google/api:annotations_proto",
    ],
)

proto_library(
    name = "http_proto",
    srcs = ["http.proto"],
    strip_import_prefix = "/third_party/googleapis/",
    visibility = ["//visibility:public"],
)

exports_files(glob(["*.proto"]))

go_proto_library(
    name = "annotations_go_proto",
    importpath = "google.golang.org/genproto/googleapis/api/annotations",
    proto = ":annotations_proto",
    deps = ["@go_googleapis//google/api:annotations_go_proto"],
)

go_library(
    name = "annotations",
    embed = [":annotations_go_proto"],
    importpath = "google.golang.org/genproto/googleapis/api/annotations",
)

buf_lint_test(
    name = "annotations_proto_lint",
    targets = [":annotations_proto"],
)
