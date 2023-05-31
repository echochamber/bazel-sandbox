load("@rules_proto//proto:defs.bzl", "ProtoInfo")

ProstProvider = provider(
    fields = ["extern_map", "crate_name"],
    init = _prost_provider_init,
)

def _prost_library_impl(ctx):

    extern_map = {}
    for package in ctx.attrs.packages:
        proto_path = "." + package
        rs_path = "::{}::".format(name) + package.replace('.', '::')
        extern_map[proto_path] = rs_path
    ctx.action.prost_proto
    outfile = actions.declare_file(package + ".rs")
    return ProstProvider(
        extern_map = extern_map,
        crate_name = ctx.attr.name
    )

prost_library = rule(
    implementation = _prost_library_impl,
    attrs = {
        "name": attr.string(),
        "protos": attr.label_list(
            mandatory = True,
            allow_empty = False,
            providers = [ProtoInfo],
            doc = "A list of proto_library targets that prost should generate .rs files from.",
        ),
        "packages": attr.string_list(
            allow_empty = False,
            mandatory = True,
            doc = "All proto packages that are defined in the protos provided from protos attribute.",
        ),
        "prost_opts": attr.string_dict(
            doc = "Prost options, keys are option names and values are their value.",
        ),
        "deps": attr.label_list(
            mandatory = False,
            allow_empty = True,
            doc = "A list of proto_library targets that prost should generate .rs files from.",
        ),
    },
)
