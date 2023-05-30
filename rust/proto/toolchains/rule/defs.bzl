def _foo_binary_impl(ctx):
    print("analyzing", ctx.label)
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(
        output = out,
        content = "Hello {}!\n".format(ctx.attr.username),
    )
    return [DefaultInfo(files = depset([out]))]

foo_binary = rule(
    implementation = _foo_binary_impl,
    attrs = {
        "username": attr.string(),
    },
)

def _foo_dir_impl(ctx):
    out = ctx.actions.declare_directory(ctx.label.name)

    content1 = "Hello {}!\n".format(ctx.attr.username)
    content2 = "Goodbyte {}!\n".format(ctx.attr.username)
    ctx.actions.run_shell(
        command = " ; ".join([
            "echo '{}' > {}/first".format(content1, out.path),
            "echo '{}' > {}/second".format(content2, out.path)
        ]),
        outputs = [out]
    )
    return [DefaultInfo(files = depset([out]))]


foo_dir = rule(
    implementation = _foo_dir_impl,
    attrs = {
        "username": attr.string(),
    },
)
