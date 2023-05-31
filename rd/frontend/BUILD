load("@aspect_rules_js//js:defs.bzl", "js_binary", "js_image_layer")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_push", "oci_tarball")

load(":defs.bzl", "ng_app", "ng_config", "ALL_DEPS")
load("//docker:defs.bzl", "docker_image")
load("//rd:defs.bzl", "REMOTE_ARTIFACT_REPO")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

package(default_visibility = ["//visibility:public"])

# The Angular application
ng_app(
    name = "app",
    project_name = "rdfrontend",
    deps = [
        # "//projects/lib-a",
    ],
)

ng_config(
    name = "ng-config",
)

pkg_tar(
    name = "app_configs_tar",
    srcs = ALL_DEPS,
    package_dir = "/app/rd/frontend"
)



# docker_image(
#     name = "server",
#     srcs = [
#         ":serve",
#     ],
#     # cmd = ["rd/frontend/serve.sh"],
#     entrypoint = ["bash"],
#     env = {
#         "PORT": "50051",
#     },
#     image_name = "rdfrontendsh",
#     port_map = "4200:4200",
#     remote_repository = REMOTE_ARTIFACT_REPO,
#     tag = "latest",
# )

# Image
js_image_layer(
    name = "layers",
    binary = ":app__js_binary",
    visibility = ["//visibility:__pkg__"],
    root = "/app",
)

oci_image(
    name = "image",
    # Since js_binary depends on bash we have to bring in a base image that has bash
    base = "@ubuntu",
    # This is going to be /{root of js_image_layer}/{package_name()}/{name of js_binary}
    # cmd = ["/app/rd/frontend/app__js_binary"],
    entrypoint = ["bash"],
    tars = [
        ":app_configs_tar",
        ":layers",
    ],
    workdir="/app/rd/frontend",
    visibility = ["//visibility:public"],
)

oci_tarball(
    name = "image_tarball",
    image = ":image",
    repo_tags = ["rdfrontendsh:latest"],
)


# docker_image(
#     name = "container",
#     srcs = [
#         ":app__js_binary",
#     ],
#     tars = [":app_configs_tar"],
#     # cmd = [
#     #     "./app__js_binary",
#     #     "rdfrontend:serve"],
#     entrypoint = ["bash"],
#     image_name = "rdfrontend",
#     port_map = "4200:4200",
#     remote_repository = REMOTE_ARTIFACT_REPO,
#     tag = "latest",
#     is_javascript = True,
#     workdir="/rd/frontend"
# )
