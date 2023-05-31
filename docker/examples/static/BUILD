load("//docker:defs.bzl", "docker_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

package(default_visibility = ["//visibility:public"])

pkg_tar(
    name = "static_tar",
    srcs = ["example.txt"],
    package_dir = "/usr/share/nginx/html",
)

# Go to http://localhost:8080/example.txt
docker_image(
    name = "example",
    base_image = "@nginx_debian_slim",
    image_name = "nginxexample",
    port_map = "8080:80",
    tag = "latest",
    tars = [
        ":static_tar",
    ],
)
