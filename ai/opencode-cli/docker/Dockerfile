FROM debian:13
RUN apt-get update && apt-get full-upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y \
      git \
      vim \
      npm \
    && apt-get clean

# see: https://www.npmjs.com/package/opencode-ai?activeTab=versions
RUN npm install -g opencode-ai@1.18.1

ENTRYPOINT ["opencode"]
