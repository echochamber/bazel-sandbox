load("//bzl-sandbox/rust/proto/toolchains:plugin.bzl", "prost_library")

package(default_visibility = ["//visibility:public"])


prost_library(
  name = "googleapi_rs",
  protos = [
    "@go_googleapis//google/api:annotations_proto"
  ]
)
