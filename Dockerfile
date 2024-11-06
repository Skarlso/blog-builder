FROM golang:latest

LABEL "name"="Hugo Builder"
LABEL "maintainer"="Gergely Brautigam <gergely@gergelybrautigam.com>"
LABEL "version"="0.0.8"

LABEL "com.github.actions.name"="Hugo Blog Builder"
LABEL "com.github.actions.description"="Build a hugo blog"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="purple"

RUN \
  apt-get update && \
  apt-get install -y ca-certificates openssl git && \
  update-ca-certificates && \
  rm -rf /var/lib/apt

RUN curl -O -L https://github.com/gohugoio/hugo/releases/download/v0.137.1/hugo_extended_0.137.1_linux-amd64.deb && dpkg -i hugo_extended_0.137.1_linux-amd64.deb

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
