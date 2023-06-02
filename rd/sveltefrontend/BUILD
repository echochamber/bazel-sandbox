package(default_visibility = ["//visibility:public"])

load("@npm//:vite/package_json.bzl", vite_bin = "bin")

BUNDLE_FILES = [
  ".npmrc",
  "package.json",
  "svelte.config.js",
  "tsconfig.json",
  "vite.config.ts",
] + glob(["src/**"]) + glob(["static/**"])

sh_binary(
    name = "foo",
    srcs = ["build.sh"],
    data = BUNDLE_FILES,
    args = ["$(execpath :.npmrc)"]
)