load("@rules_proto//proto:defs.bzl", "proto_library")
load("//bzl-sandbox/rust/proto/toolchains/old/custom2:defs.bzl", "buf_gen_rust_proto")


package(default_visibility = ["//bzl-sandbox/rust/proto/toolchains/old/custom2"])

package_group(
    name = "custom2",
    packages = [
        "//bzl-sandbox/rust/proto/toolchains/old/custom2/...",
    ],
)

proto_library(
    name = "custom2_proto",
    srcs = [
      "annotated.proto",
      "simple.proto"
    ],
    deps = [
        "@go_googleapis//google/api:annotations_proto",
    ],
)

rust_binary(
    name = "manual_test",
    srcs = ["src/main.rs"],
    deps = [
        ":rust_proto_lib",
        "//third_party/rust:prost",
        "//third_party/rust:prost_types"
    ],
)

buf_gen_rust_proto(
  name = "rust_proto_lib",
  srcs = [
    ":custom2_proto",
  ],
  deps = [
    "@go_googleapis//google/api:annotations_proto",
    "@go_googleapis//google/api:api_proto",
  ]
)