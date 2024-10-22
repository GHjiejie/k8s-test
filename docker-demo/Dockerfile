FROM golang:latest AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .
#scratch 是一个空镜像，不包含任何文件系统，包括 shell。 
#因此，你无法直接通过 kubectl exec -it <pod-name> -- /bin/sh 进入该镜像的终端，因为 /bin/sh 不存在。
#RUN CGO_ENABLED=0 GOOS=linux go build -o main . 

FROM scratch AS runner

WORKDIR /app

COPY --from=builder /app/main .

EXPOSE 3000

CMD ["./main"]
