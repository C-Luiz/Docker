# Etapa 1: Build
FROM golang:1.21 AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o converter convert.go

# Etapa 2: Runtime leve
FROM alpine:latest

RUN apk add --no-cache ffmpeg

WORKDIR /app
COPY --from=builder /app/converter .

ENTRYPOINT ["./converter"]
CMD ["input.mp4", "avi"]

