load("@rules_rust//rust:defs.bzl", "rust_binary")
load("//bzl-sandbox/docker:defs.bzl", "docker_image")
load("//bzl-sandbox/rd:defs.bzl", "REMOTE_ARTIFACT_REPO")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

rust_binary(
    name = "main",
    srcs = ["src/main.rs"],
    proc_macro_deps = [
        "//third_party/rust:prost_derive",
    ],
    deps = [
        "//bzl-sandbox/rd/proto/echochamber/helloworld/v1:v1_proto_rs",
        "//bzl-sandbox/rd/proto/echochamber/helloworld/v1:v1_tonic_rs",
        "//bzl-sandbox/rust/proto/common:googleapi_rs",
        "//third_party/rust:env_logger",
        "//third_party/rust:log",
        "//third_party/rust:protoc_wkt",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:tonic_reflection",
    ],
)

docker_image(
    name = "server",
    srcs = [
        ":main",
    ],
    entrypoint = ["/main"],
    env = {
        "PORT": "50051",
        "RUST_LOG": "info",
    },
    image_name = "example-grpc",
    port_map = "50051:50051",
    remote_repository = REMOTE_ARTIFACT_REPO,
    tag = "latest",
)
