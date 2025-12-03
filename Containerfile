# sha256 as of 2021-09-02
FROM docker.io/library/alpine:3.14.2@sha256:69704ef328d05a9f806b6b8502915e6a0a4faa4d72018dc42343f511490daf8a

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        bash=5.1.16-r0 \
        curl=8.0.1-r0 \
        jq=1.6-r1

RUN curl -sSLo /usr/local/bin/kubectl https://dl.k8s.io/release/v1.20.2/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

COPY cloudflare-cache-purge.bash /usr/local/bin/cloudflare-cache-purge

ENTRYPOINT ["/usr/local/bin/cloudflare-cache-purge"]
