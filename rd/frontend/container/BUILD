load("@rules_oci//oci:defs.bzl", "oci_image", "oci_push", "oci_tarball")
load("//docker:defs.bzl", "docker_image")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

package(default_visibility = ["//visibility:public"])

pkg_tar(
    name = "static_tar",
    srcs = ["//rd/frontend/container/static:static"],
    package_dir = "/usr/share/nginx/html"
)

pkg_tar(
    name = "rdfrontend_tar",
    srcs = ["//rd/frontend:app"],
    package_dir = "/usr/share/nginx/html",
)

pkg_tar(
    name = "nginx_conf_tar",
    srcs = [":nginx.conf"],
    package_dir = "/etc/nginx",
)

# Go to http://localhost:8080
docker_image(
    name = "frontend",
    base_image = "@nginx_debian_slim",
    image_name = "rdfrontend",
    port_map = "8080:80",
    tag = "latest",
    tars = [
        ":nginx_conf_tar",
        ":rdfrontend_tar",
    ],
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
