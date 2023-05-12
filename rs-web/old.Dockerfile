# Rust as the base image
FROM rust:buster as build

# create a new empty shell project
RUN USER=root cargo new --bin rs-docker-web
WORKDIR /rs-docker-web

# copy over your manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

# this build step will cache your dependencies
RUN cargo build --release
RUN rm src/*.rs

# copy your source tree
COPY ./src ./src

# build for release
RUN rm ./target/release/deps/rs-docker-web*
RUN cargo build --release

# our final base
FROM rust:slim-buster

# copy the build artifact from the build stage
COPY --from=build /rs-docker-web/target/release/rs-docker-web .

# set the startup command to run your binary
CMD ["./rs-docker-web"]