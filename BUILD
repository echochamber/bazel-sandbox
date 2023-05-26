load("@bazel_gazelle//:def.bzl", "gazelle", "gazelle_binary")
load("@io_bazel_rules_go//proto:compiler.bzl", "go_proto_compiler")


# gaazelle:prefix github.com/echochamber/rustdocker
gazelle(
    name = "gazelle",
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
    name = "gazelle-update-repos",
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
        "@bazel_gazelle//language/proto",  # Built-in rule from gazelle for Protos.
        # Any languages that depend on Gazelle's proto plugin must come after it.
        "@rules_buf//gazelle/buf:buf",  # Loads the Buf extension
    ],
    visibility = ["//visibility:public"],
)
