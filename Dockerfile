FROM golang:1.25-alpine AS builder
RUN apk add --no-cache git
RUN go install github.com/charmbracelet/gum@v0.17.0

FROM alpine:3.22
COPY --from=builder /go/bin/gum /usr/local/bin/gum

WORKDIR /app