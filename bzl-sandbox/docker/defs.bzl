"""Defs for common docker build rules."""

load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_tarball")

def docker_image(
        name,
        srcs,
        entrypoint,
        cmd = None,
        env = None,
        port_map = "",
        tag = "default"):
    """Runs an image using docker."""

    if not env:
        env = {}
    if not cmd:
        cmd = []

    # Step 2: Compress it to layer using pkg_tar
    image_layer_name = name + "_image_layer"
    pkg_tar(
        name = image_layer_name,
        srcs = srcs,
    )

    oci_image_name = name + "_image"
    oci_image(
        name = oci_image_name,
        base = "@ubuntu",
        tars = [":" + image_layer_name],
        entrypoint = entrypoint,
        cmd = cmd,
        env = env,
    )

    tarball_name = name + "_tarball"
    oci_tarball(
        name = tarball_name,
        image = ":" + oci_image_name,
        repo_tags = [tag],
    )
    native.sh_binary(
        name = name,
        srcs = [
            "//bzl-sandbox/docker:docker_run.sh",
        ],
        args = [
            ("$(location :" + tarball_name + ")"),
            tag,
            port_map,
        ],
        data = [
            ":" + tarball_name,
        ],
    )

# def _docker_run_impl(name, tarball_target, tag = "default"):
# """Runs an image using docker."""
#   native.sh_binary(
#       name = name,
#       srcs = [
#         "//bzl-sandbox/bzl/docker:docker_run.sh"
#       ],
#       args = [
#         ("$(location " + tarball_target + ")"),
#         tag
#       ],
#       data = [
#         tarball_target
#       ]
#   )

# docker_run = rule(
#   implementation = _docker_run_impl,
#   attrs = {
#     "name": attr.string(),
#     "tarball_target": attr.label(),
#     "tag": attr.string()
#   }
# )
# # sh_binary(
# #   name = "run_docker",
# #   srcs = [
# #     ":docker.sh"
# #   ],
# #   args = [
# #     "$(locations //bzl-sandbox/rust/summation:server_tarball)",
# #     "rd-server:latest"
# #   ],
# #   data = [
# #     "//bzl-sandbox/rust/summation:server_tarball"
# #   ]
# # )
