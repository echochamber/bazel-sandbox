load("@rules_rust//rust:defs.bzl", "rust_binary")
load("//bzl-sandbox/docker:defs.bzl", "docker_image")

package(default_visibility = ["//rd:internal"])

rust_binary(
    name = "server_bin",
    srcs = [
        "src/main.rs",
    ],
    deps = [
        "//third_party/rust:bytes",
        "//third_party/rust:dotenv",
        "//third_party/rust:echochamber_rdproto",
        "//third_party/rust:prost",
        "//third_party/rust:tokio",
        "//third_party/rust:tonic",
        "//third_party/rust:uuid",
    ],
)

docker_image(
    name = "server",
    srcs = [
        "//bzl-sandbox/rust/summation/service:server_bin",
    ],
    entrypoint = ["/server_bin"],
    env = {
        "PORT": "50055",
    },
    tag = "rd-grpc:latest",
)
