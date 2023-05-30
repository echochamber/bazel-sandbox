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

# --Aspect - General Bazel Utils (jq/yq) --

http_archive(
    name = "aspect_bazel_lib",
    sha256 = "e3151d87910f69cf1fc88755392d7c878034a69d6499b287bcfc00b1cf9bb415",
    strip_prefix = "bazel-lib-1.32.1",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v1.32.1/bazel-lib-v1.32.1.tar.gz",
)

load(
    "@aspect_bazel_lib//lib:repositories.bzl",
    "aspect_bazel_lib_dependencies",
    "register_copy_directory_toolchains",
    "register_copy_to_directory_toolchains",
    "register_jq_toolchains",
    "register_yq_toolchains",
)

aspect_bazel_lib_dependencies()

register_jq_toolchains()

register_yq_toolchains()

# Can probably remove 2 lines below later.
register_copy_directory_toolchains()

register_copy_to_directory_toolchains()

# --Aspect - General Bazel Utils (jq/yq) --

########################################

# --Go/Gazelle--

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "6b65cb7917b4d1709f9410ffe00ecf3e160edf674b78c54a894471320862184f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.39.0/rules_go-v0.39.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.39.0/rules_go-v0.39.0.zip",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "727f3e4edd96ea20c29e8c2ca9e8d2af724d8c7778e7923a854b2c80952bc405",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.30.0/bazel-gazelle-v0.30.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.30.0/bazel-gazelle-v0.30.0.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("//:deps.bzl", "go_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.20.2")

# My external go deps.
# gazelle:repository_macro deps.bzl%go_dependencies
go_dependencies()

gazelle_dependencies()

# --Gazelle--

########################################

# --Protobuf--

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

# End --Protobuf--

########################################

# --Python--

http_archive(
    name = "rules_python",
    sha256 = "94750828b18044533e98a129003b6a68001204038dc4749f40b195b24c38f49f",
    strip_prefix = "rules_python-0.21.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.21.0/rules_python-0.21.0.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories", "python_register_toolchains")

py_repositories()

python_register_toolchains(
    name = "python3_9",
    python_version = "3.9",
)

load("@python3_9//:defs.bzl", "interpreter")
load("@rules_python//python:pip.bzl", "pip_parse")

# Create a central repo that knows about the dependencies needed from
# requirements_lock.txt.
pip_parse(
    name = "pip_deps",
    python_interpreter_target = interpreter,
    requirements_lock = "//third_party/pip_deps:requirements_lock.txt",
)

# Load the starlark macro which will define your dependencies.
load("@pip_deps//:requirements.bzl", "install_deps")

# Call it to define repos for your requirements.
install_deps()

# Python gazelle plugin
http_archive(
    name = "rules_python_gazelle_plugin",
    sha256 = "94750828b18044533e98a129003b6a68001204038dc4749f40b195b24c38f49f",
    strip_prefix = "rules_python-0.21.0/gazelle",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.21.0/rules_python-0.21.0.tar.gz",
)

load("@rules_python_gazelle_plugin//:deps.bzl", _py_gazelle_deps = "gazelle_deps")

_py_gazelle_deps()

# --Python--

########################################

# --JS/Node/Typescript --

# Javascript

http_archive(
    name = "aspect_rules_js",
    sha256 = "d8827db3c34fe47607a0668e86524fd85d5bd74f2bfca93046d07f890b5ad4df",
    strip_prefix = "rules_js-1.27.0",
    url = "https://github.com/aspect-build/rules_js/releases/download/v1.27.0/rules_js-v1.27.0.tar.gz",
)

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")

rules_js_dependencies()

http_archive(
    name = "aspect_rules_esbuild",
    sha256 = "2ea31bd97181a315e048be693ddc2815fddda0f3a12ca7b7cc6e91e80f31bac7",
    strip_prefix = "rules_esbuild-0.14.4",
    url = "https://github.com/aspect-build/rules_esbuild/releases/download/v0.14.4/rules_esbuild-v0.14.4.tar.gz",
)

load("@aspect_rules_esbuild//esbuild:dependencies.bzl", "rules_esbuild_dependencies")

rules_esbuild_dependencies()

load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "nodejs",
    node_version = DEFAULT_NODE_VERSION,
)

load("@aspect_rules_js//npm:repositories.bzl", "npm_import", "npm_translate_lock")

npm_translate_lock(
    name = "npm",
    data = [
        "//:pnpm-workspace.yaml",
    ],
    npmrc = "//:.npmrc",
    pnpm_lock = "//:pnpm-lock.yaml",
    verify_node_modules_ignored = "//:.bazelignore",
)

load("@aspect_rules_esbuild//esbuild:repositories.bzl", "esbuild_register_toolchains", LATEST_ESBUILD_VERSION = "LATEST_VERSION")

esbuild_register_toolchains(
    name = "esbuild",
    esbuild_version = LATEST_ESBUILD_VERSION,
)

# Typescript

http_archive(
    name = "aspect_rules_ts",
    sha256 = "ace5b609603d9b5b875d56c9c07182357c4ee495030f40dcefb10d443ba8c208",
    strip_prefix = "rules_ts-1.4.0",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v1.4.0/rules_ts-v1.4.0.tar.gz",
)

load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")

rules_ts_dependencies(ts_version_from = "//:package.json")

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()

# As an example, manually import a package using explicit coordinates.
# Just a demonstration of the syntax de-sugaring.
npm_import(
    name = "acorn__8.4.0",
    bins = {"acorn": "./bin/acorn"},
    integrity = "sha512-ULr0LDaEqQrMFGyQ3bhJkLsbtrQ8QibAseGZeaSUiT/6zb9IvIkomWHJIvgvwad+hinRAgsI51JcWk2yvwyL+w==",
    package = "acorn",
    # Root package where to link the virtual store
    root_package = "",
    version = "8.4.0",
)

# --Node/Typescript --

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
load("//third_party/rust:crates.bzl", "raze_fetch_remote_crates")

raze_fetch_remote_crates()

### Rules_Rust
load("@rules_rust//tools/rust_analyzer:deps.bzl", "rust_analyzer_dependencies")

rust_analyzer_dependencies()

load("@rules_rust//proto:repositories.bzl", "rust_proto_repositories")

rust_proto_repositories()

# End --Rust--

########################################

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

########################################
# --Pkg--
# Rules for building packages (tar/zip/deb/rpm)
http_archive(
    name = "rules_pkg",
    sha256 = "8f9ee2dc10c1ae514ee599a8b42ed99fa262b757058f65ad3c384289ff70c4b8",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
    ],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()
# Rules for building package s (tar/zip/deb/rpm)
# --Pkg--

########################################

# --Go/Gazelle/buf tool--

# Seems buf needs this
http_archive(
    name = "io_bazel_stardoc",
    sha256 = "ec57139e466faae563f2fc39609da4948a479bb51b6d67aedd7d9b1b8059c433",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/stardoc/releases/download/0.5.4/stardoc-0.5.4.tar.gz",
        "https://github.com/bazelbuild/stardoc/releases/download/0.5.4/stardoc-0.5.4.tar.gz",
    ],
)

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")

stardoc_repositories()

# Buf

http_archive(
    name = "rules_buf",
    sha256 = "523a4e06f0746661e092d083757263a249fedca535bd6dd819a8c50de074731a",
    strip_prefix = "rules_buf-0.1.1",
    urls = [
        "https://github.com/bufbuild/rules_buf/archive/refs/tags/v0.1.1.zip",
    ],
)

load("@rules_buf//buf:repositories.bzl", "rules_buf_dependencies", "rules_buf_toolchains")

rules_buf_dependencies()

rules_buf_toolchains(version = "v1.5.0")

load("@rules_buf//gazelle/buf:repositories.bzl", "gazelle_buf_dependencies")

gazelle_buf_dependencies()

load("@rules_buf//buf:defs.bzl", "buf_dependencies")

buf_dependencies(
    name = "buf_deps",
    modules = [
        "buf.build/googleapis/googleapis:cc916c31859748a68fd229a3c8d7a2e8",
        "buf.build/envoyproxy/protoc-gen-validate:dc09a417d27241f7b069feae2cd74a0e",
    ],
)

load("//:buf_deps.bzl", "buf_deps")

# gazelle:repository_macro buf_deps.bzl%buf_deps
buf_deps()

########################################

# --GRPC--

http_archive(
    name = "rules_proto_grpc",
    sha256 = "928e4205f701b7798ce32f3d2171c1918b363e9a600390a25c876f075f1efc0a",
    strip_prefix = "rules_proto_grpc-4.4.0",
    urls = ["https://github.com/rules-proto-grpc/rules_proto_grpc/releases/download/4.4.0/rules_proto_grpc-4.4.0.tar.gz"],
)

load("@rules_proto_grpc//:repositories.bzl", "rules_proto_grpc_repos", "rules_proto_grpc_toolchains")

rules_proto_grpc_toolchains()

rules_proto_grpc_repos()

load("@rules_proto_grpc//grpc-gateway:repositories.bzl", rules_proto_grpc_gateway_repos = "gateway_repos")

rules_proto_grpc_gateway_repos()

load("@com_github_grpc_ecosystem_grpc_gateway_v2//:repositories.bzl", "go_repositories")

go_repositories()

########################################
