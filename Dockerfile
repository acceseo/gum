FROM golang:1.25-alpine AS builder
RUN apk add --no-cache git
RUN go install github.com/charmbracelet/gum@v0.17.0

FROM alpine:3.23

LABEL org.opencontainers.image.title="gum"
LABEL org.opencontainers.image.description="Lightweight cli wrapper for charmbracelet/gum"
LABEL org.opencontainers.image.authors="acceseo Projects S.L."
LABEL org.opencontainers.image.url="https://github.com/acceseo/gum"
LABEL org.opencontainers.image.licenses="MIT"

COPY --from=builder /go/bin/gum /usr/local/bin/gum

WORKDIR /app