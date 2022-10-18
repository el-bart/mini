FROM debian:11
RUN apt-get update && apt-get install -y --no-install-recommends \
    kicad \
    kicad-packages3d
RUN apt-get update && apt-get install -y --no-install-recommends \
    freecad
RUN apt-get update && apt-get install -y --no-install-recommends \
    fakeroot \
    make
RUN apt-get update && apt-get install -y --no-install-recommends \
    gzip \
    tar \
    zip

COPY \
  generate_bom \
  generate_gerber \
  generate_stl \
  step2stl \
  /usr/local/bin/

ENV HOME=/tmp/
RUN mkdir -p /tmp/.config/
COPY kicad /tmp/.config/kicad
