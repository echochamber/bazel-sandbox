load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

exports_files(glob([
    "*.go",
]))

go_binary(
    name = "server",
    embed = [":server_lib"],
    data = [
        "//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter_openapiv2",
    ],
    env = {
        "OPENAPI_JSON_PATH": "$(location //bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter_openapiv2)"
    }
)

# TODO: Figure out why gazelle doesn't know the origin of the gateway dep and keeps removing it from here.
# gazelle:resolve go github.com/echochamber/rustdocker/bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1/gateway //bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:gateway
go_library(
    name = "server_lib",
    srcs = ["main.go"],
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rd/proto/server",
    deps = [
        "//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:gateway",
        "@com_github_golang_glog//:glog",
        "@com_github_grpc_ecosystem_grpc_gateway_v2//runtime",
        "@org_golang_google_grpc//:go_default_library",
        "@org_golang_google_grpc//credentials/insecure",
    ],
)
