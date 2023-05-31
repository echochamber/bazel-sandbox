load("@rules_oci//oci:pull.bzl", "oci_pull")

def pull_oci_images():
    oci_pull(
        name = "nginx_debian_slim",
        digest = "sha256:6b06964cdbbc517102ce5e0cef95152f3c6a7ef703e4057cb574539de91f72e6",
        image = "docker.io/library/nginx",
    )

    oci_pull(
        name = "debian_buster_slim",
        digest = "sha256:fdb38c743a538d301ddcedd3047c43bf4fcc70211c8534c5b613916910fe1b9d",
        image = "docker.io/library/debian",
        platforms = [
            "linux/amd64",
            "linux/arm64",
        ],
    )

    oci_pull(
        name = "debian_buster",
        digest = "sha256:b5efff3e971bdb0c5aff76d74167ada1841d34596af7378ca79006d51c8c8adb",
        image = "docker.io/library/debian",
    )

    oci_pull(
        name = "ubuntu",
        digest = "sha256:ca5534a51dd04bbcebe9b23ba05f389466cf0c190f1f8f182d7eea92a9671d00",
        image = "docker.io/library/ubuntu",
    )
