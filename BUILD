load("@bazel_gazelle//:def.bzl", "gazelle", "gazelle_binary")
load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")
load("@pnpm__links//:defs.bzl", npm_link_pnpm = "npm_link_imported_package")
load("@acorn__8.4.0__links//:defs.bzl", npm_link_acorn = "npm_link_imported_package")
load("@npm//:defs.bzl", "npm_link_all_packages")

# gazelle:prefix github.com/echochamber/bazel-sandbox
# gazelle:exclude rust/proto/
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

# Link all packages from the /WORKSPACE npm_translate_lock(name = "npm") and also packages from
# manual /WORKSPACE npm_import rules to bazel-bin/node_modules as well as the virtual store
# bazel-bin/node_modules/.aspect_rules_js since /pnpm-lock.yaml is the root of the pnpm workspace
npm_link_all_packages(
    name = "node_modules",
    imported_links = [
        npm_link_acorn,
        npm_link_pnpm,
    ],
)

# buildifier: disable=load-on-top
load("//:npm_links.bzl", "npm_links")

npm_links()
# buildifier: enable=load-on-top
