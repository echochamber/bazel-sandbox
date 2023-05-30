query  = """attr\\('generator_name', '^node_modules$$', '//...'\\)"""
query_cmd = "bazel query {}".format(query)
genrule(
    name = "concat_all_files",
    srcs = [
    ],
    outs = ["concatenated.txt"],
    # # Fails
    # cmd = """red="$$(cd /home/jschein/Code/rust/rustdocker > /dev/null ; bazel)" ; echo "$$red" > $@"""
    # Works
    cmd = """red="$$(cd /home/jschein/Code/rust/rustdocker > /dev/null ; echo 'hello')" ; echo "$$red" > $@"""
)