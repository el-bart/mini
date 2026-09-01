FROM debian:13
RUN apt-get update && apt-get full-upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y \
      git \
      vim \
      python3-pip \
      python3-venv \
    && apt-get clean


COPY hermes-python-proxy /usr/local/bin/
RUN python3 -m venv /opt/hermes
# TODO: this is unsupported with newer versions of the harness
# see: https://pypi.org/project/hermes-agent/
RUN hermes-python-proxy pip install hermes-agent==0.19.0

ENTRYPOINT ["hermes-python-proxy", "hermes"]
