# Empty build file so we can import docker rules in //WORKSPACE

load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/echochamber/rustdockertools
gazelle(
    name = "gazelle",
    args = [
        "-exclude=grpc/*",
        "-exclude=rdproto/*",
    ],
    command = "update",
)

gazelle(
    name = "gazelle-update-repos",
    args = [
        "-from_file=go.mod",
        "-to_macro=deps.bzl%go_dependencies",
        "-prune",
    ],
    command = "update-repos",
)
