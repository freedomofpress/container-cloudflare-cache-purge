# sha256 as of 2021-09-02
FROM alpine:3.14.2@sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash curl jq && \
    rm -rf /var/cache/apk/*

RUN curl -sSLo /usr/local/bin/kubectl https://dl.k8s.io/release/v1.20.2/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

COPY cloudflare-purge /usr/local/bin

ENTRYPOINT ["/usr/local/bin/cloudflare-purge"]
