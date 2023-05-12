FROM rust:buster AS builder
# 1. Create a new empty shell project
RUN USER=root cargo new --bin rs-web
WORKDIR /rs-web
# 2. Copy our manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
# 3. Build only the dependencies to cache them
RUN cargo build --release
RUN rm src/*.rs
# 4. Now that the dependency is built, copy your source code
COPY ./src ./src

# 5. Build for release.
RUN rm ./target/release/deps/rs-web*
RUN cargo install --path .

# our final base
FROM debian:buster-slim as base

# copy the build artifact from the build stage
COPY --from=build /rs-web/target/release/rs-web .

# set the startup command to run your binary
CMD ["./rs-web"]
