load("@rules_buf//buf:defs.bzl", "buf_dependencies")

def buf_deps():
    buf_dependencies(
        name = "buf_deps_bzl-sandbox_rust_summation2",
        modules = [
            "buf.build/googleapis/googleapis:cc916c31859748a68fd229a3c8d7a2e8",
        ],
    )
