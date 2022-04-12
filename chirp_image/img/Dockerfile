FROM debian:10
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt-get install -y \
    ca-certificates

# create local user
ARG UID
ARG GID
RUN addgroup user --gid "$GID"
RUN adduser user --uid "$UID" --gid "$GID"

RUN apt-get update && apt-get install -y chirp
RUN apt-get update && apt-get install -y wget

RUN cd /opt && \
    wget "https://trac.chirp.danplanet.com/chirp_daily/LATEST/chirp-daily-20220408.tar.gz" && \
    tar xzvf chirp-daily-*.tar.gz && \
    cd chirp-daily-* && \
    ln -s "$PWD/chirpw" /usr/local/bin/
