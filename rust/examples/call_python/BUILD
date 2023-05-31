load("@rules_rust//rust:defs.bzl", "rust_binary")

rust_binary(
    name = "main",
    srcs = ["main.rs"],
    data = [
        "@python3_9_x86_64-unknown-linux-gnu//:python",
    ],
    rustc_env = {
        "PYTHON_PATH": "$(rootpath @python3_9_x86_64-unknown-linux-gnu//:python)",
    },
    deps = [],
)
