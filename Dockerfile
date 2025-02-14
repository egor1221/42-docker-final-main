FROM golang:1.22.0

WORKDIR ./

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

COPY *.db ./

ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64 

RUN go build -o /docker_final_project

CMD ["/docker_final_project"]