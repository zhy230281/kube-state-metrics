ARG GOVERSION=1.21
ARG GOARCH
ARG GOARCH=amd64
#FROM golang:${GOVERSION} as builder
#WORKDIR /go/src/k8s.io/kube-state-metrics/
#COPY . /go/src/k8s.io/kube-state-metrics/
#RUN make build-local

FROM gcr.io/distroless/static:latest-${GOARCH}
COPY kube-state-metrics /
USER nobody
ENTRYPOINT ["/kube-state-metrics", "--port=8080", "--telemetry-port=8081"]
EXPOSE 8080 8081
