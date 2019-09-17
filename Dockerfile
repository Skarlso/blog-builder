FROM golang:latest

LABEL "name"="Hugo Builder"
LABEL "maintainer"="Gergely Brautigam <gergely@gergelybrautigam.com>"
LABEL "version"="0.0.2"

LABEL "com.github.actions.name"="Hugo Blog Builder"
LABEL "com.github.actions.description"="Build a hugo blog"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="purple"

RUN \
  apt-get update && \
  apt-get install -y ca-certificates openssl git hugo && \
  update-ca-certificates && \
  rm -rf /var/lib/apt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
