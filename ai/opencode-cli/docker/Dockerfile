FROM debian:13
RUN apt-get update && apt-get full-upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y \
      git \
      vim \
      npm \
    && apt-get clean

# see: https://www.npmjs.com/package/@opencode/cli?activeTab=versions
# or:  npm view @opencode/cli
RUN npm install -g @opencode/cli@2.2.0

ENTRYPOINT ["opencode"]
