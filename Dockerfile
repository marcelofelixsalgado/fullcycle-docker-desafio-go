FROM golang:alpine3.15 as build

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN go build -o /hello


FROM scratch
COPY --from=build /hello /hello
CMD [ "/hello" ]
