package(default_visibility = ["//visibility:public"])

package_group(
    name = "docker",
    packages = [
        "//bzl-sandbox/docker/...",
    ],
)
exports_files(["docker_run.sh"])


# load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

# bzl_library(
#     name = "docker",
#     srcs = ["docker_run.bzl"],
#     visibility = ["//visibility:public"],
#     deps = [
#         "@bazel_skylib//lib:types",
#         "@bazel_skylib//rules:write_file",
#     ],
# )
