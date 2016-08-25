FROM debian:stable

RUN apt-get update
RUN apt-get dist-upgrade -y --force-yes
RUN apt-get install -y --force-yes openssh-server vim gimp
RUN apt-get clean

RUN mkdir /var/run/sshd
COPY entry /usr/local/bin/

RUN useradd -m -U -s /bin/bash gimp
RUN mkdir /home/gimp/.ssh
COPY authorized_keys /home/gimp/.ssh/

ENTRYPOINT ["/usr/local/bin/entry"]
