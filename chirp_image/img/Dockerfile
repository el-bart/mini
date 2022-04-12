FROM debian:11
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

# flatpak-based installation
RUN apt-get update && apt-get install -y flatpak
RUN flatpak remote-add --if-not-exists flathub "https://flathub.org/repo/flathub.flatpakrepo"
RUN cd /tmp && \
    wget "https://trac.chirp.danplanet.com/chirp_daily/LATEST/chirp-daily-20220408.flatpak" && \
    flatpak install -y chirp-daily-*.flatpak
