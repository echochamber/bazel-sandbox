load("@aspect_rules_esbuild//esbuild:defs.bzl", "esbuild")
load("@npm//:@angular/compiler-cli/package_json.bzl", angular_compiler_cli = "bin")

package(default_visibility = ["//visibility:public"])

# Define the @angular/compiler-cli ngc bin binary as a target
angular_compiler_cli.ngc_binary(
    name = "ngc",
    visibility = ["//visibility:public"],
)

exports_files(
    [
        "karma.conf.js",
        "test-setup.ts",
    ],
    visibility = ["//visibility:public"],
)

esbuild(
    name = "test_bootstrap",
    testonly = 1,
    entry_point = ":test-bootstrap.js",
    metafile = False,
    sourcemap = "inline",
    visibility = ["//visibility:public"],
    deps = [
        "//:node_modules/zone.js",
    ],
)
