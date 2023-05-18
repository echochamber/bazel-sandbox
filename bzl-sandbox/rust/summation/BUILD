load("@io_bazel_rules_docker//rust:image.bzl", "rust_image")

package(default_visibility = [":internal"])
package_group(
    name = "internal",
    packages = [
        "//bzl-sandbox/rust/summation/...",
    ],
)

rust_image(
    name = "server_image",
    binary = "//bzl-sandbox/rust/summation/service:server",
)