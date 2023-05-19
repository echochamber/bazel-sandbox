# The version of cargo-raze from cargo install isn't working for me, but building it myself does.
# Not sure why, too many other things also not working so I'll leave this for later.
$HOME/Code/rust/external/cargo-raze/impl/target/debug/cargo-raze --manifest-path="$HOME/Code/rust/rustdocker/third_party/rust/Cargo.toml" --output="$HOME/Code/rust/rustdocker/third_party/rust/" --generate-lockfile