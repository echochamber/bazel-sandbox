load("//bzl-sandbox/rust/proto/toolchains/custom:prost_tonic.bzl", "prost_tonic_rust_lib")

package(default_visibility = ["//visibility:public"])

prost_tonic_rust_lib(
    name = "summation3",
    srcs = ["summation3.proto"],
    gen_yaml = "//bzl-sandbox/rust/summation3:buf.gen.yaml"
)