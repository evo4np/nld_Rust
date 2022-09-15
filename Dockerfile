FROM rust:1.62 AS builder
COPY . .
RUN cargo build --release

FROM debian:buster-slim
COPY --from=builder ./target/release/nl_detection ./target/release/nl_detection
CMD ["/target/release/nl_detection"]