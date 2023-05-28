Approaches to trying to get rust protos working with prost + bazel.

- custom/ - Approach uses [buf](https://buf.build/) to vendor deps and provide transitive deps.
- custom2/ - requires all transitive deps be manually specified in the deps, only depends upon prost
and related prost crates.