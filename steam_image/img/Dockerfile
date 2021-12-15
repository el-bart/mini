FROM debian:11
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt-get install -y \
    ca-certificates

# steam core
COPY steam.list /etc/apt/sources.list.d/
COPY steam-keyring.gpg /usr/share/keyrings/
RUN apt-get update && apt-get dist-upgrade
RUN apt-get update && apt-get install -y --no-install-recommends -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' \
    steam-launcher
# extra deps, missing from package
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
    libc6:i386 \
    libgl1:i386
# workaround for some bug in runner script from steam
RUN ln -s /usr/bin/steam /usr/local/bin/steam

RUN apt-get update && apt-get install --yes \
    pulseaudio-utils
COPY pulse-client.conf /etc/pulse/client.conf

# create local user and add to audio group
ARG UID
ARG GID
RUN addgroup user --gid "$GID"
RUN adduser user --uid "$UID" --gid "$GID"
RUN adduser user audio
