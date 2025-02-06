FROM golang:1.22.0

WORKDIR ./

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /docker_final_project

CMD ["/docker_final_project"]