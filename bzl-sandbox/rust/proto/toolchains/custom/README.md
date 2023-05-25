# Generate Rust Proto Library With Prost/Tonic

## Usage

1. Install buf build (only dep that isn't managed by bazel).
2. Create .proto file, buf.gen.yaml file, and buf.mod file.
   1. Declare exteranl deps in buf.mod file.
3. Use buf mod update to generate buf.lock file from buf.mod file.
4. Import build macro and use it like so


```python
load("//bzl-sandbox/rust/proto/toolchains/custom:prost_tonic.bzl", "buf_gen_rust_proto")
  
buf_gen_rust_proto(
    name = "helloworld_rust_proto",
    srcs = ["//bzl-sandbox/rd/proto/proto/echochamber/helloworld/v1:greeter.proto"],
    gen_yaml = "//bzl-sandbox/rd/proto:buf.gen.yaml",
    buf_lock = "//bzl-sandbox/rd/proto:buf.lock",
)
```

5. Make rust_binary or rust_library and depend on generated source code.

```python
rust_binary(
    name = "manual_test",
    srcs = ["src/main.rs"],
    deps = [
        ":helloworld_rust_proto",
    ],
)
```

6. Use generated bindings in rust source, crate name will be name attribute of `buf_gen_rust_proto`




## Notes on Implementation

### Initial Approach

My initial approach for integrating tonic/prost into bazel was to define a
rust_proto_toolchain so that rust_proto_library would work just like any other
{language}_proto_library. See here:
    bzl-sandbox/rust/proto/toolchains/BUILD

That approach doesn't work because the way prost/tonic generate .rs files
doesn't work nicely with the way bazel expects rules to declare to their output
files in advance. See more here:
    https://github.com/bazelbuild/rules_rust/issues/1973


### This approach

So my second approach is this. It works like so:
    - Use https://buf.build/docs/ to manage external deps and vendor them into
    bazel using https://github.com/bufbuild/rules_buf.
    - Cargo build.rs script (this file) to integrate calling buf for rust with
    prost/tonic into bazel.
    