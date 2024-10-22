FROM golang:latest AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o main .


FROM alpine:latest AS runner

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 3000

CMD ["./main"]
