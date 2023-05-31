load("//rust/proto/toolchains:plugin.bzl", "prost_library")

package(default_visibility = ["//visibility:public"])

prost_library(
    name = "googleapi_rs",
    protos = [
        "@go_googleapis//google/api:annotations_proto",
    ],
)

prost_library(
    name = "openapiv2_options_rs",
    protos = [
        "@com_github_grpc_ecosystem_grpc_gateway_v2//protoc-gen-openapiv2/options:options_proto",
    ],
)
