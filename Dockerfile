FROM golang:1.6-alpine

RUN apk --no-cache add \
    ca-certificates \
    iptables \
    make \
    git

WORKDIR /go/src/github.com/jtblin/kube2iam
ADD . /go/src/github.com/jtblin/kube2iam

RUN make setup && make cross && cp build/bin/linux/kube2iam /bin/kube2iam

ENTRYPOINT ["kube2iam"]
