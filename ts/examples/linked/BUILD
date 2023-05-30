load("@aspect_rules_js//npm:defs.bzl", "npm_package")
load("@aspect_rules_ts//ts:defs.bzl", "ts_project")
load("@npm//:defs.bzl", "npm_link_all_packages")
load("@aspect_rules_js//js:defs.bzl", "js_binary")

npm_link_all_packages(name = "node_modules")

# A basic library with 2 simple dependencies (packages with no dependencies)
ts_project(
    name = "ts_lib",
    srcs = ["index.ts"],
    declaration = True,
    visibility = ["//visibility:public"],
    deps = [
        ":node_modules/@aspect-test/e",
        ":node_modules/@aspect-test/f",
        ":node_modules/@types/node",
    ],
)

# Exposed via npm_package()
npm_package(
    name = "linked",
    srcs = [
        "package.json",
        ":ts_lib",
    ],
    visibility = ["//visibility:public"],
)

js_binary(
    name = "bin",
    data = [
        ":ts_lib",
    ],
    entry_point = ":ts_lib",
)
