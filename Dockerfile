# syntax=docker/dockerfile:1
# check=error=true

FROM ghcr.io/tcely/docker-magic-wormhole-base AS magic-wormhole-mailbox-server

RUN set -eux; \
    . "${HOME}/bin/activate" && \
    pip install --upgrade pip && \
    pip install magic-wormhole-mailbox-server

VOLUME ["/app/data"]
ENTRYPOINT ["/app/bin/entrypoint.sh", "twist", "wormhole-mailbox", "--channel-db=./data/channel.sqlite"]
CMD ["--usage-db=./data/usage.sqlite"]

