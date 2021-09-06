FROM golang:1.16-alpine AS build
WORKDIR /go/src
ENV CGO_ENABLED=1
COPY main.go .
RUN go build main.go

FROM scratch AS prod
COPY --from=build go/src/main /
CMD ["./main"]