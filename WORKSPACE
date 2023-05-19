workspace(name = "rustdocker")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

########################################

# --Rust--
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

### Cargo raze deps
###
load("//third_party/rust:crates.bzl", "raze_fetch_remote_crates")

# Note that this method's name depends on your gen_workspace_prefix setting.
# `raze` is the default prefix.
raze_fetch_remote_crates()

### rules_proto
### Release info from https://github.com/bazelbuild/rules_proto/releases
http_archive(
    name = "rules_proto",
    sha256 = "dc3fb206a2cb3441b485eb1e423165b231235a1ea9b031b4433cf7bc1fa460dd",
    strip_prefix = "rules_proto-5.3.0-21.7",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/refs/tags/5.3.0-21.7.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

load("@rules_rust//tools/rust_analyzer:deps.bzl", "rust_analyzer_dependencies")

rust_analyzer_dependencies()

# --Rust--

########################################

# --CPP--

# git_repository(
#     name = "com_github_gflags_gflags",
#     remote = "https://github.com/gflags/gflags.git",
#     tag = "v2.2.2"
# )

# --CPP--

########################################

# --GO--

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "6b65cb7917b4d1709f9410ffe00ecf3e160edf674b78c54a894471320862184f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.39.0/rules_go-v0.39.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.39.1/rules_go-v0.39.0.zip",
    ],
)

git_repository(
    name = "bazel_gazelle",
    commit = "f377e6eff8e24508feb1a34b1e5e681982482a9f",
    remote = "https://github.com/bazelbuild/bazel-gazelle",
    shallow_since = "1648046534 -0400",
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.19.4")

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

# Use gazelle to declare Go dependencies in Bazel.

load("//:deps.bzl", "go_dependencies")

go_repository(
    name = "org_golang_x_xerrors",
    importpath = "golang.org/x/xerrors",
    sum = "h1:E7g+9GITq07hpfrRu66IVDexMakfv52eLZ2CXBWiKr4=",
    version = "v0.0.0-20191204190536-9bdfabe68543",
)

# gazelle:repository_macro deps.bzl%go_dependencies
go_dependencies()

# gazelle:repository go_repository name=org_golang_x_xerrors importpath=golang.org/x/xerrors
# This must be invoked after our explicit dependencies
# See https://github.com/bazelbuild/bazel-gazelle/issues/1115.
gazelle_dependencies()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "977a0bd4593c8d4c8f45e056d181c35e48aa01ad4f8090bdb84f78dca42f47dc",
    strip_prefix = "buildtools-6.1.2",
    urls = ["https://github.com/bazelbuild/buildtools/archive/v6.1.2.tar.gz"],
)

load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

buildifier_dependencies()

# --GO--

########################################

# # --Docker--
# http_archive(
#     name = "io_bazel_rules_docker",
#     sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
#     urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
# )
# load(
#     "@io_bazel_rules_docker//repositories:repositories.bzl",
#     container_repositories = "repositories",
# )
# container_repositories()

# load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

# container_deps()
# load(
#     "@io_bazel_rules_docker//rust:image.bzl",
#     _rust_image_repos = "repositories",
# )

# _rust_image_repos()

# # load(
# #     "@io_bazel_rules_docker//container:container.bzl",
# #     "container_pull",
# # )
# # --Docker--

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
