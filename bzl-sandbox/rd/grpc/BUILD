load("@rules_rust//rust:defs.bzl", "rust_binary")
load("//bzl-sandbox/docker:defs.bzl", "docker_image")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

rust_binary(
    name = "main",
    srcs = ["src/main.rs"],
    proc_macro_deps = [
        "//third_party/rust:prost_derive",
    ],
    deps = [
        "//bzl-sandbox/rd/proto:helloworld_rust_proto",
        "//third_party/rust:bytes",
        "//third_party/rust:dotenv",
        "//third_party/rust:env_logger",
        "//third_party/rust:futures",
        "//third_party/rust:log",
        "//third_party/rust:prost",
        "//third_party/rust:prost_types",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:tonic_reflection",
        "//third_party/rust:uuid",
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
    port_map = "50051:50051",
    tag = "rd-server:latest",
)
