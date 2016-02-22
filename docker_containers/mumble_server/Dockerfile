FROM debian:stable
MAINTAINER BaSz

RUN apt-get update
RUN apt-get dist-upgrade -y --force-yes
RUN apt-get install -y --force-yes vim mumble-server
RUN apt-get clean

RUN echo && \
echo "###############################################################################" && \
echo && \
echo "SECURITY NOTE: be sure to change server password in /etc/mumble-server.ini file" && \
echo && \
echo "###############################################################################" && \
echo

COPY mumble-server.ini /etc/mumble-server.ini

#STOPSIGNAL SIGTERM SIGINT

EXPOSE 64738/tcp 64738/udp
ENTRYPOINT /usr/sbin/murmurd -ini /etc/mumble-server.ini -fg -v
