FROM debian:13
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

# create local user and add to audio group
ARG UID
ARG GID
RUN addgroup user --gid "$GID"
RUN adduser user --uid "$UID" --gid "$GID"
RUN adduser user audio
