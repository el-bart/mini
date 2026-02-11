FROM debian:13
RUN apt-get update && apt-get full-upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y \
      git \
      vim \
      npm \
    && apt-get clean

# see: https://www.npmjs.com/package/@github/copilot?activeTab=versions
RUN npm install -g @github/copilot@0.0.406

COPY shell_proxy /usr/local/bin/
ENTRYPOINT ["shell_proxy", "copilot"]
