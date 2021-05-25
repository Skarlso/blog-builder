FROM golang:latest

LABEL "name"="Hugo Builder"
LABEL "maintainer"="Gergely Brautigam <gergely@gergelybrautigam.com>"
LABEL "version"="0.0.6"

LABEL "com.github.actions.name"="Hugo Blog Builder"
LABEL "com.github.actions.description"="Build a hugo blog"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="purple"

RUN \
  apt-get update && \
  apt-get install -y ca-certificates openssl git && \
  update-ca-certificates && \
  rm -rf /var/lib/apt

RUN curl -O -L https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_0.83.1_Linux-64bit.deb && dpkg -i hugo_0.83.1_Linux-64bit.deb

COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]
