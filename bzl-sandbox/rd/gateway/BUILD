load("//bzl-sandbox/docker:defs.bzl", "docker_image")
load("//bzl-sandbox/rd:defs.bzl", "REMOTE_ARTIFACT_REPO")
load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library")

package(default_visibility = ["//bzl-sandbox/rd:internal"])

go_binary(
    name = "main",
    data = [
        "//bzl-sandbox/rd/proto/echochamber/helloworld/v1:v1_openapiv2",
    ],
    embed = [":main_lib"],
    env = {
        "OPENAPI_JSON_PATH": "$(location //bzl-sandbox/rd/proto/echochamber/helloworld/v1:v1_openapiv2)",
    },
)

# TODO: Figure out why gazelle doesn't know the origin of the gateway dep and keeps removing it from here.
# gazelle:resolve go github.com/echochamber/rustdocker/bzl-sandbox/rd/proto/echochamber/helloworld/v1/gateway //bzl-sandbox/rd/proto/echochamber/helloworld/v1:gateway
go_library(
    name = "main_lib",
    srcs = ["main.go"],
    importpath = "github.com/echochamber/rustdocker/bzl-sandbox/rd/gateway",
    deps = [
        "//bzl-sandbox/rd/proto/echochamber/helloworld/v1:v1_gateway",
        "@com_github_golang_glog//:glog",
        "@com_github_grpc_ecosystem_grpc_gateway_v2//runtime",
        "@org_golang_google_grpc//:go_default_library",
        "@org_golang_google_grpc//credentials/insecure",
    ],
)

docker_image(
    name = "server",
    srcs = [
        ":main",
    ],
    cmd = [
        "--proxy-port=8081",
        # Swap below flags when using bazel run
        "--grpc-server-endpoint=localhost:50051",
        # "--grpc-server-endpoint=grpc:50051",
    ],
    entrypoint = ["/main"],
    image_name = "example-grpc-gateway",
    port_map = "8081:8081",
    remote_repository = REMOTE_ARTIFACT_REPO,
    tag = "latest",
)
