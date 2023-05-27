"""Defs for common docker build rules."""

load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_tarball", "oci_push")

def docker_image(
        name,
        srcs,
        entrypoint,
        tag,
        remote_repository="",
        cmd = None,
        env = None,
        port_map = "",
        image_name = ""):
    """Creates targets for running an oci_image using docker or deploying it to a remote repo.

    Args:
        name: Image name.
        tag: Image tag.
        srcs: All binaries this image should contain. *_binary() targets.
        entrypoint: The entrypoint to use when running the container.
        remote_repository: Optional, provide a remote repo to push this image to.
        cmd: Array of strings. Additional command line arguments to pass the entrypoint.
        env: Env variables to set in this image
        port_map: Port map to expose.
        image_name: Optional, Image name to use. Otherwise defaults to name arg.

    Example:
        GCP_REPO_NAME = 'my-repo'
        GCP_PROJECT_NAME = 'my-google-cloud-project'
        py_binary(
            name = "main",
            srcs = ["main.py"],
            deps = []
        )
        docker_image(
            name = "server",
            srcs = [
                ":main",
            ],
            cmd = [
                # Flags to pass to the binary.
                "--proxy-port=8081",
                "--grpc-server-endpoint=localhost:50051",
            ],
            entrypoint = ["/main"],
            port_map = "8081:8081",
            tag = "latest",
            remote_repository = "us-central1-docker.pkg.dev/" + $GCP_PROJECT_NAME + "/" $GCP_REPO_NAME
    """

    if not image_name:
        image_name = name

    if not env:
        env = {}
    if not cmd:
        cmd = []

    tagged_name = "{}:{}".format(image_name, tag)

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
        repo_tags = [tagged_name],
    )
    native.sh_binary(
        name = name + "_run",
        srcs = [
            "//bzl-sandbox/docker:docker_run.sh",
        ],
        args = [
            "-f $(location :" + tarball_name + ")",
            " -- ",
            "--publish {}".format(port_map),
        ],
        data = [
            ":" + tarball_name,
        ],
    )
    if remote_repository:

        oci_push(
            name = name + "_push",
            image = ":" + oci_image_name,
            repository = "{}/{}".format(remote_repository, image_name),
            remote_tags = [tag]
        )