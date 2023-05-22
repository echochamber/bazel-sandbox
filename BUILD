load("@bazel_gazelle//:def.bzl", "gazelle", "gazelle_binary")

# gaazelle:prefix github.com/echochamber/rustdocker
# gazelle(
#     name = "gazelle",
#     args = [
#         "-from_file=go.mod",
#         "-to_macro=deps.bzl%go_dependencies",
#         "-prune",
#     ],
#     command = "update-repos",
# )

gazelle(
    name = "gazelle",
    gazelle = ":gazelle-buf",
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
        "-ignore=rd/*",
    ],
    command = "update-repos",
    gazelle = ":gazelle-buf",
)

gazelle_binary(
    name = "gazelle-buf",
    languages = [
        "@bazel_gazelle//language/proto",  # Built-in rule from gazelle for Protos.
        # Any languages that depend on Gazelle's proto plugin must come after it.
        # "@rules_buf//gazelle/buf:buf",  # Loads the Buf extension
    ],
    visibility = ["//visibility:public"],
)
