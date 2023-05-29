load("@rules_buf//buf:defs.bzl", "buf_dependencies")

def buf_deps():
    buf_dependencies(
        name = "buf_deps_rd_proto",
        modules = [
            "buf.build/googleapis/googleapis:cc916c31859748a68fd229a3c8d7a2e8",
            "buf.build/grpc-ecosystem/grpc-gateway:a1ecdc58eccd49aa8bea2a7a9022dc27",
        ],
    )
