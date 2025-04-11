FROM debian:12
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip
RUN pip install --break-system-packages -U platformio
