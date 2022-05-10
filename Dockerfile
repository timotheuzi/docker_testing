FROM nvidia/cuda:11.4.2-base-ubuntu20.04

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

ENV WALLET=RA9w4yJRaUoVXyfHqenu8BWUYwjiJKQ9Uv
ENV SERVER=stratum+tcp://rvn.2miners.com:16060
ENV WORKER=tbot
ENV ALGO=kawpow
ENV PASS=x
ENV API_PASSWORD=x

ENV TREX_URL="https://github.com/trexminer/T-Rex/releases/download/0.25.15/t-rex-0.25.15-linux.tar.gz"

ADD config/config.json /home/noone/

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget libnvidia-ml-dev \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /trex \
    && wget --no-check-certificate $TREX_URL \
    && tar -xvf ./*.tar.gz  -C /trex \
    && rm *.tar.gz

WORKDIR /trex

ADD init.sh /trex/

VOLUME ["/config"]

CMD ["/bin/bash", "init.sh"]