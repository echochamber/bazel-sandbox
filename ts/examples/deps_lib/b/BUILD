load("@aspect_rules_ts//ts:defs.bzl", "ts_project")

ts_project(
    name = "b",
    srcs = ["index.ts"],
    declaration = True,
    tsconfig = "//ts/examples/deps_lib:tsconfig",
    visibility = ["//ts/examples/deps_lib:__subpackages__"],
)