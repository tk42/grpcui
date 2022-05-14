FROM golang:alpine AS builder

LABEL maintainer="Tadashi Kojima <nsplat@gmail.com>"

RUN apk update && apk add --no-cache git

RUN go install github.com/fullstorydev/grpcui/cmd/grpcui@latest

COPY scripts/ /usr/local/scripts/
RUN chmod +x /usr/local/scripts/*.sh

EXPOSE 8080/tcp

FROM alpine:latest

COPY --from=builder /usr/local/scripts /usr/local/scripts
COPY --from=builder /go/bin/grpcui /usr/bin/grpcui

RUN apk update && apk add --no-cache bash
RUN adduser -S -u 10001 user
USER user

CMD ["/usr/local/scripts/start.sh"]
