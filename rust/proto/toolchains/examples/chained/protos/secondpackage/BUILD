load("@rules_proto//proto:defs.bzl", "proto_library")
load("//rust/proto/toolchains:plugin.bzl", "prost_library")

package(default_visibility = ["//visibility:public"])

proto_library(
    name = "second_proto",
    srcs = ["second.proto"],
    strip_import_prefix = "/rust/proto/toolchains/examples",
    deps = [
        "//rust/proto/toolchains/examples/chained/protos/firstpackage:first_proto",
    ],
)

prost_library(
    name = "second_prost_rs",
    protos = [
        ":second_proto",
    ],
    externs = {
      ".chained.protos.firstpackage": "::first_prost_rs::chained::protos::firstpackage",
    },
    deps = [
        "//rust/proto/toolchains/examples/chained/protos/firstpackage:first_prost_rs",
    ],
)