load("@bazel_skylib//rules:copy_file.bzl", "copy_file")

# This is an API workspace, having public visibility by default makes perfect sense.
package(default_visibility = ["//visibility:public"])

exports_files(glob(["*.proto"]))

copy_file(
    name = "http_proto",
    src = "//third_party/googleapis/google/api:http.proto",
    out = "google/api/http.proto",
)

exports_files(glob(["*.proto"]))
