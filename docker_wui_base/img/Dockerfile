FROM debian:11
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt-get install -y \
    ca-certificates

# create local user
ARG UID
ARG GID
RUN addgroup user --gid "$GID"
RUN adduser user --uid "$UID" --gid "$GID"
