FROM rust:buster AS builder
# 1. Create a new empty shell project
RUN USER=root cargo new --bin grpc
WORKDIR /grpc

# Install protobuf compiler.
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install --no-install-recommends --assume-yes \
      protobuf-compiler
# Install buf https://buf.build/docs
RUN BIN="/usr/local/bin" && \
  VERSION="1.18.0" && \
  curl -sSL \
  "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-$(uname -s)-$(uname -m)" \
  -o "${BIN}/buf" && \
  chmod +x "${BIN}/buf"
# protoc plugins used by buf to generate rust bindings
# See https://github.com/neoeinstein/protoc-gen-prost
RUN cargo install protoc-gen-prost-crate protoc-gen-prost protoc-gen-tonic


# 2. Copy our manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
# 3. Build only the dependencies to cache them
RUN cargo build -p grpc --release
RUN rm src/*.rs
# 4. Now that the dependency is built, copy and build our code.
COPY ./src ./src
COPY ./.env ./.env
RUN rm ./target/release/deps/server*
RUN cargo install --path .

# our final base
FROM debian:buster-slim as final


# copy the build artifact from the build stage
COPY --from=builder /grpc/target/release/server /usr/src/server
COPY --from=builder /grpc/.env /.env

# set the startup command to run your binary
CMD ["/usr/src/server"]
