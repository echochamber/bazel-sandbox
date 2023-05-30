load("@rules_proto//proto:defs.bzl", "ProtoInfo")

def _prost_provider_init(*, proto_packages, crate_name, outs):
    if not proto_packages:
        fail("Proto packages cannot be empty")
    if not outs:
        fail("Outs must be provided.")
    if not crate_name:
        fail("Crate name must be provided")
    return {
        "proto_packages": proto_packages,
        "crate_name": crate_name,
        "outs": outs,
    }

ProstProvider = provider(
    fields = ["proto_crate_map", "outs"],
    init = _prost_provider_init,
)

def _prost_library_impl(ctx):
    crate_map = {ctx.attr.crate_root: ctx.attr.packages}
    all_crate_maps = depset(
        crate_map,
        transitive = [dep[ProstProvider].proto_crate_map for dep in deps])
    all_out_dirs = depset(
        ctx.attr.out_dir,
        transitive = [dep[ProstProvider].out_dir for dep in deps])
    return ProstProvider(
        proto_crate_map = all_crate_maps,
        out_dir = all_out_dirs
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
        "deps": 
    },
)
