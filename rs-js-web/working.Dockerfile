FROM rust:buster AS builder
COPY . .
RUN cargo build --release

FROM debian:buster-slim
COPY --from=builder ./target/release/rs-docker-web ./target/release/rs-docker-web
CMD ["/target/release/rs-docker-web"]