# Build image
FROM golang:1.17 as builder

WORKDIR /app/src
COPY ./src .
RUN go build -o ./bin/fullcycle

# Deploy image
FROM scratch

WORKDIR /app
COPY --from=builder /app/src/bin .
ENTRYPOINT [ "./fullcycle" ]