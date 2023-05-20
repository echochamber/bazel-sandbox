workspace(name = "rustdocker")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

########################################


# Bazel Skylib
http_archive(
    name = "bazel_skylib",
    sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

########################################

# --Protobuf--

# rules_cc defines rules for generating C++ code from Protocol Buffers.
http_archive(
    name = "rules_cc",
    sha256 = "35f2fb4ea0b3e61ad64a369de284e4fbbdcdba71836a5555abb5e194cf119509",
    strip_prefix = "rules_cc-624b5d59dfb45672d4239422fa1e3de1822ee110",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_cc/archive/624b5d59dfb45672d4239422fa1e3de1822ee110.tar.gz",
        "https://github.com/bazelbuild/rules_cc/archive/624b5d59dfb45672d4239422fa1e3de1822ee110.tar.gz",
    ],
)

# rules_java defines rules for generating Java code from Protocol Buffers.
http_archive(
    name = "rules_java",
    sha256 = "ccf00372878d141f7d5568cedc4c42ad4811ba367ea3e26bc7c43445bbc52895",
    strip_prefix = "rules_java-d7bf804c8731edd232cb061cb2a9fe003a85d8ee",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_java/archive/d7bf804c8731edd232cb061cb2a9fe003a85d8ee.tar.gz",
        "https://github.com/bazelbuild/rules_java/archive/d7bf804c8731edd232cb061cb2a9fe003a85d8ee.tar.gz",
    ],
)

http_archive(
    name = "rules_proto",
    sha256 = "2490dca4f249b8a9a3ab07bd1ba6eca085aaf8e45a734af92aad0c42d9dc7aaf",
    strip_prefix = "rules_proto-218ffa7dfa5408492dc86c01ee637614f8695c45",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/218ffa7dfa5408492dc86c01ee637614f8695c45.tar.gz",
        "https://github.com/bazelbuild/rules_proto/archive/218ffa7dfa5408492dc86c01ee637614f8695c45.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")
rules_proto_dependencies()
rules_proto_toolchains()

# End --Protobuf--

########################################

# --Rust--


### Rust Toolchain
###
http_archive(
    name = "rules_rust",
    sha256 = "25209daff2ba21e818801c7b2dab0274c43808982d6aea9f796d899db6319146",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.21.1/rules_rust-v0.21.1.tar.gz"],
)

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains(
    edition = "2021",
    extra_target_triples = [
        "wasm32-unknown-unknown",
        # wasm32-wasi doesn't appear to be a platform on my bazel install.
        # Run `bazel query @platforms//...` to see available platforms.
        #
        # "wasm32-wasi"
    ],
    versions = [
        "1.68.2",
    ],
)

### Cargo raze - External Dep Management
###
load("//third_party/rust:crates.bzl", "raze_fetch_remote_crates")

# Note that this method's name depends on your gen_workspace_prefix setting.
# `raze` is the default prefix.
raze_fetch_remote_crates()

### Rust Analyzer - For IDE Integrations
###
load("@rules_rust//tools/rust_analyzer:deps.bzl", "rust_analyzer_dependencies")

rust_analyzer_dependencies()

### Proto toolchain for rust
###
load('@rules_rust//proto:repositories.bzl', 'rust_proto_repositories')

register_toolchains("//bzl-sandbox/rust/proto/toolchains:rust_prost_proto")

rust_proto_repositories(register_default_toolchain = "//bzl-sandbox/rust/proto/toolchains:rust_prost_proto")

# End --Rust--

########################################

# --External Proto Dep Management--

http_archive(
    name = "com_google_googleapis",
    sha256 = "5bb6b0253ccf64b53d6c7249625a7e3f6c3bc6402abd52d3778bfa48258703a0",
    strip_prefix = "googleapis-2f9af297c84c55c8b871ba4495e01ade42476c92",
    urls = [
        "https://storage.googleapis.com/grpc-bazel-mirror/github.com/googleapis/googleapis/archive/2f9af297c84c55c8b871ba4495e01ade42476c92.tar.gz",
        "https://github.com/googleapis/googleapis/archive/2f9af297c84c55c8b871ba4495e01ade42476c92.tar.gz",
    ],
)


########################################

# --OCI Docker--

http_archive(
    name = "rules_oci",
    sha256 = "7824dcb6c9f9f87786d65592da006d9f1e2bea826d7560d96745e54cdecb5d47",
    strip_prefix = "rules_oci-1.0.0-rc1",
    url = "https://github.com/bazel-contrib/rules_oci/releases/download/v1.0.0-rc1/rules_oci-v1.0.0-rc1.tar.gz",
)

load("@rules_oci//oci:dependencies.bzl", "rules_oci_dependencies")

rules_oci_dependencies()

load("@rules_oci//oci:repositories.bzl", "LATEST_CRANE_VERSION", "oci_register_toolchains")

oci_register_toolchains(
    name = "oci",
    crane_version = LATEST_CRANE_VERSION,
    # Uncommenting the zot toolchain will cause it to be used instead of crane for some tasks.
    # Note that it does not support docker-format images.
    # zot_version = LATEST_ZOT_VERSION,
)

# Pull the specific images we want to support
load("@rules_oci//oci:pull.bzl", "oci_pull")

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

# --OCI Docker--


# Rules for building package s (tar/zip/deb/rpm)
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "rules_pkg",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
    ],
    sha256 = "8f9ee2dc10c1ae514ee599a8b42ed99fa262b757058f65ad3c384289ff70c4b8",
)
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")
rules_pkg_dependencies()
# Rules for building package s (tar/zip/deb/rpm)