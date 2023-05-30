load("@aspect_rules_ts//ts:defs.bzl", "ts_project")
load("@aspect_rules_esbuild//esbuild:defs.bzl", "esbuild")


# Macro to wrap Angular's ngc compiler
def ng_project(name, **kwargs):
    ts_project(
        name = name,

        # NGC compiler, do not use the standard tsc worker
        tsc = "//ts/angular/tools:ngc",
        supports_workers = False,

        # Any other ts_project() or generic args
        **kwargs
    )


def ng_esbuild(name, **kwargs):
    """The rules_esbuild esbuild() configured with the Angular linker configuration
    """

    esbuild(
        name = name,
        config = "//ts/angular/tools:ngc.esbuild.js",
        **kwargs
    )