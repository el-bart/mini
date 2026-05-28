FROM debian:13
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt-get install -y \
    ca-certificates

RUN apt-get update && apt-get install --yes \
    pulseaudio-utils
COPY pulse-client.conf /etc/pulse/client.conf

# some tools
RUN apt-get update && apt-get install --yes \
    htop \
    vim

# mesa, GLX, etc...
RUN apt-get update && apt-get install --yes \
    mesa-vulkan-drivers \
    vulkan-tools \
    mesa-utils \
    libgl1-mesa-dri

# Xwayland stuff
RUN apt-get update && apt-get install --yes \
    xwayland \
    xwayland-run

RUN apt-get update && apt-get install --yes \
    wine \
    wine32:i386

COPY debian.sources /etc/apt/sources.list.d/
RUN apt-get update && apt-get install --yes \
    winetricks

# create local user and add to audio group
ARG UID
ARG GID
RUN addgroup user --gid "$GID"
RUN adduser user --uid "$UID" --gid "$GID"
RUN adduser user audio

RUN mkdir -p "/run/user/$UID" && \
    chown "$UID:$UID" "/run/user/$UID" && \
    chmod 700 "/run/user/$UID"
RUN winetricks d3dx9_24
