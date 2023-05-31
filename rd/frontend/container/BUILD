load("@rules_oci//oci:defs.bzl", "oci_image", "oci_push", "oci_tarball")
load("@rules_pkg//:pkg.bzl", "pkg_tar")

package(default_visibility = ["//visibility:public"])

pkg_tar(
    name = "static_tar",
    srcs = ["//rd/frontend/container/static:static"],
    package_dir = "/usr/share/nginx/html"
)

pkg_tar(
    name = "nginx_conf_tar",
    srcs = [":nginx.conf"],
    package_dir = "/etc/nginx"
)

oci_image(
    name = "nginx",
    base = "@nginx_debian_slim",
    # cmd = [],
    # entrypoint = ["bash"],
    tars = [
      ":static_tar",
      # ":nginx_conf_tar"
    ],
    workdir="/",
    visibility = ["//visibility:public"],
)

oci_tarball(
    name = "nginx_tarball",
    image = ":nginx",
    repo_tags = ["nginxstatic:latest"],
)

