FROM debian:13
RUN apt-get update && apt-get full-upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y \
      vim \
      wget \
      zstd \
    && apt-get clean


RUN wget -O /tmp/ollama.tar.zst https://ollama.com/download/ollama-linux-amd64.tar.zst
RUN tar xf /tmp/ollama.tar.zst -C /usr/
ENTRYPOINT ["ollama"]
