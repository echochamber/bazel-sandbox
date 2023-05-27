load("@bazel_gazelle//:def.bzl", "gazelle", "gazelle_binary")
load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")

# gazelle:prefix github.com/echochamber/rustdocker
# gazelle:exclude rd/*
gazelle(
    name = "gazelle",
)

gazelle(
    name = "gazelle-repos",
    args = [
        "-from_file=go.mod",
        "-to_macro=deps.bzl%go_dependencies",
        "-prune",
    ],
    command = "update-repos",
)

gazelle(
    name = "gazelle-buf",
    gazelle = ":gazelle-buf-base",
)

gazelle(
    name = "gazelle-buf-repos",
    args = [
        # This can also be `buf.yaml` and `buf.lock`
        "--from_file=buf.work.yaml",
        # This is optional but recommended, if absent gazelle
        # will add the rules directly to WORKSPACE
        "-to_macro=buf_deps.bzl%buf_deps",
        # Deletes outdated repo rules
        "-prune",
    ],
    command = "update-repos",
    gazelle = ":gazelle-buf-base",
)

gazelle_binary(
    name = "gazelle-buf-base",
    languages = [
        "@bazel_gazelle//language/go",
        "@bazel_gazelle//language/proto",
        # Any languages that depend on Gazelle's proto plugin must come after it.
        "@rules_buf//gazelle/buf:buf",  # Loads the Buf extension
    ],
    visibility = ["//visibility:public"],
)

buildifier(
    name = "buildifier",
)
