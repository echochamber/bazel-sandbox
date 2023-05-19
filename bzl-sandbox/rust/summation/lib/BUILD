load("@rules_rust//rust:defs.bzl", "rust_binary", "rust_library", "rust_test")

package(default_visibility = ["//bzl-sandbox/rust/summation:internal"])

rust_library(
    name = "src_summation",
    srcs = [
        "f64.rs",
        "lib.rs",
        "u32.rs",
    ],
    deps = ["//third_party/rust:log"],
)

# Run release mode
# bazel run -c opt  :executable -- 1 2 3.0
rust_binary(
    name = "executable",
    srcs = ["main.rs"],
    # The crate_root file, this would default to main.rs but we put it in for clarity
    crate_root = "main.rs",
    deps = [
        ":src_summation",
    ],
)

rust_test(
    name = "lib_test",
    crate = ":src_summation",
    deps = [],
)
