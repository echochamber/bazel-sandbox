FROM rust:buster AS builder
# 1. Create a new empty shell project
RUN USER=root cargo new --bin webapp
WORKDIR /webapp
# 2. Copy our manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
# 3. Build only the dependencies to cache them
RUN cargo build -p webapp --release
RUN rm src/*.rs
# 4. Now that the dependency is built, copy and build our code.
COPY ./src ./src
COPY ./.env ./.env
RUN rm ./target/release/deps/webapp*
RUN cargo install --path .

# our final base
FROM debian:buster-slim as final

# Install shared libraries
RUN apt-get update && apt-get install libssl-dev -y

# copy the build artifact from the build stage
COPY --from=builder /webapp/target/release/webapp /usr/src/webapp
COPY --from=builder /webapp/.env /.env

# set the startup command to run your binary
CMD ["/usr/src/webapp"]
