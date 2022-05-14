FROM ubuntu:20.04
#FROM --platform=linux/amd64

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

ENV WALLET=RA9w4yJRaUoVXyfHqenu8BWUYwjiJKQ9Uv
ENV SERVER=stratum+tcp://rvn.2miners.com:16060
ENV WORKER=tbot
ENV ALGO=kawpow
ENV PASS=x
ENV API_PASSWORD=x

ENV TREX_URL="https://github.com/todxx/teamredminer/releases/download/v0.9.4.2/teamredminer-v0.9.4.2-linux.tgz"

#ADD config/config.json /home/noone/
RUN apt-get install software-properties-common
RUN add-apt-repository ppa:oibaf/graphics-drivers
RUN apt-get update && apt-get install -y --no-install-recommends \
    #wget libnvidia-ml-dev \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /trex \
    && wget --no-check-certificate $TREX_URL \
    && tar -xvf ./*.tar.gz  -C /trex \
    && rm *.tar.gz

WORKDIR /trex

ADD init.sh /trex/

VOLUME ["/config"]

CMD ["/bin/bash", "init.sh"]