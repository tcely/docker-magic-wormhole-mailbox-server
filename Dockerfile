# syntax=docker/dockerfile:1
# check=error=true

FROM ghcr.io/tcely/docker-magic-wormhole-base AS magic-wormhole-mailbox-server

USER root
RUN set -eux; \
    install -v -d -o app -g app -m 01777 /data

USER app
RUN set -eu; \
    . "${HOME}/bin/activate" ; set -x ; \
    pip install --upgrade pip && \
    pip install magic-wormhole-mailbox-server

EXPOSE 4000/tcp
VOLUME ["/data"]
ENTRYPOINT ["/app/bin/entrypoint.sh", "twist", "--log-format=text", "wormhole-mailbox", "--channel-db=/data/channel.sqlite"]
CMD ["--usage-db=/data/usage.sqlite"]

