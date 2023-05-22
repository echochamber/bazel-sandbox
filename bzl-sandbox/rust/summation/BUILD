# load("@io_bazel_rules_docker//rust:image.bzl", "rust_image")
load("//bzl-sandbox/docker:defs.bzl", "docker_image")

package(default_visibility = [":internal"])

package_group(
    name = "internal",
    packages = [
        "//bzl-sandbox/rust/summation/...",
    ],
)

docker_image(
    name = "server",
    srcs = [
        "//bzl-sandbox/rust/summation/service:server_bin",
    ],
    entrypoint = ["/server_bin"],
    env = {
        "PORT": "50051",
    },
    port_map = "50051:50051",
    tag = "rd-server:latest",
)
