# load("@io_bazel_rules_docker//rust:image.bzl", "rust_image")
load("//bzl-sandbox/docker:defs.bzl", "docker_image")

package(default_visibility = [":internal"])

package_group(
    name = "internal",
    packages = [
        "//bzl-sandbox/rust/summation2/...",
    ],
)