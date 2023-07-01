FROM golang:1.14-buster as builder
RUN GO111MODULE=on GOOS=linux go get -ldflags "-linkmode external -extldflags -static" github.com/jaeles-project/jaeles
RUN GO111MODULE=on GOOS=linux go get -ldflags "-linkmode external -extldflags -static" github.com/mafredri/cdp
FROM alpine:latest
RUN apk update && apk upgrade && apk add --no-cache bash git && apk add --no-cache chromium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# Installs latest Chromium package.
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
    harfbuzz@edge \
    nss@edge \
    freetype@edge \
    ttf-freefont@edge \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

WORKDIR /
COPY --from=builder /go/bin/jaeles /bin/jaeles
EXPOSE 5000
RUN jaeles config init -y
ENTRYPOINT ["/bin/jaeles"]