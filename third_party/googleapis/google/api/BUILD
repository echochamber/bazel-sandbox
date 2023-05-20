load("@rules_proto//proto:defs.bzl", "proto_library")

# This is an API workspace, having public visibility by default makes perfect sense.
package(default_visibility = ["//visibility:public"])

##############################################################################
# Common
##############################################################################
proto_library(
    name = "annotations_proto",
    srcs = ["annotations.proto"],
    deps = [
        ":http_proto",
        "@com_google_protobuf//:descriptor_proto",
    ],
    strip_import_prefix = "/third_party/googleapis/"
)
proto_library(
    name = "http_proto",
    srcs = ["http.proto"],
    visibility = ["//visibility:public"],
    strip_import_prefix = "/third_party/googleapis/"
)

exports_files(glob(["*.proto"]))