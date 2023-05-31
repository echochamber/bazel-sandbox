load(":defs.bzl", "ng_app", "ng_config")
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
    name = "rdfrontend_tar",
    srcs = [":app"],
    package_dir = "/usr/share/nginx/html",
)

pkg_tar(
    name = "nginx_conf_tar",
    srcs = [":nginx.conf"],
    package_dir = "/etc/nginx",
)

# Go to http://localhost:8080
docker_image(
    name = "image",
    base_image = "@nginx_debian_slim",
    image_name = "rdfrontend",
    port_map = "8080:80",
    remote_repository = REMOTE_ARTIFACT_REPO,
    tag = "latest",
    tars = [
        ":nginx_conf_tar",
        ":rdfrontend_tar",
    ],
)
