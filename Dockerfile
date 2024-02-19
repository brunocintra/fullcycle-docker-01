# stage builder
FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN go build -o rocksapp .

# stage copy
FROM scratch
WORKDIR /app
COPY --from=builder /app/rocksapp .
CMD ["./rocksapp"]