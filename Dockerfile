FROM debian:stretch

RUN apt update \
  && apt install -y \
  libluajit-5.1-2 \
  libgl1-mesa-glx

ADD https://github.com/TES3MP/openmw-tes3mp/releases/download/0.7.0-alpha/tes3mp-server-GNU+Linux-x86_64-release-0.7.0-alpha-0df32accca-edbcae5b0e.tar.gz /tmp/tes3mp-server.tar.gz 

RUN tar -xvf /tmp/tes3mp-server.tar.gz

RUN rm -rf /var/lib/apt/lists/* /tmp/tes3mp-server.tar.gz

EXPOSE 25565/udp
CMD ["/TES3MP-server/tes3mp-server"]
