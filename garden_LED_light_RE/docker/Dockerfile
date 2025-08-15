FROM debian:13
RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get update && apt-get install -y --no-install-recommends \
    kicad \
    kicad-packages3d

RUN apt-get update && apt-get install -y --no-install-recommends \
    prusa-slicer

RUN apt-get update && apt-get install -y --no-install-recommends \
    fakeroot \
    make \
    gzip \
    tar \
    zip

COPY \
  generate_bom \
  generate_stl \
  list_cu_layers \
  print_on_error \
  /usr/local/bin/
