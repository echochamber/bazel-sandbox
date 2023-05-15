FROM rust:buster AS builder
# 1. Create a new empty shell project
RUN USER=root cargo new --bin grpc
WORKDIR /grpc

# Install protobuf compiler.
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install --no-install-recommends --assume-yes \
      protobuf-compiler


# 2. Copy our manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
# 3. Build only the dependencies to cache them
RUN cargo build -p grpc --release
RUN rm src/*.rs
# 4. Now that the dependency is built, copy and build our code.
COPY ./proto/ ./proto/
COPY ./build.rs ./build.rs
COPY ./src ./src
COPY ./.env ./.env
RUN rm ./target/release/deps/grpc*
RUN cargo install --path .

# our final base
FROM debian:buster-slim as final


# copy the build artifact from the build stage
COPY --from=builder /grpc/target/release/grpc /usr/src/grpc
COPY --from=builder /grpc/.env /.env

# set the startup command to run your binary
CMD ["/usr/src/grpc"]
