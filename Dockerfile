FROM ubuntu:20.04

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

ENV WALLET=RA9w4yJRaUoVXyfHqenu8BWUYwjiJKQ9Uv
ENV SERVER=stratum+tcp://rvn.2miners.com:16060
ENV WORKER=tbot
ENV ALGO=kawpow
ENV PASS=x
ENV API_PASSWORD=x

ENV TRM_URL="https://github.com/todxx/teamredminer/releases/download/v0.9.4.2/teamredminer-v0.9.4.2-linux.tgz"

RUN apt-get update && apt-get install -y -y python \
    && apt-get install -y software-properties-common \
    #wget libnvidia-ml-dev \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /mining \
    && wget --no-check-certificate $TRM_URL \
    && tar -xvf ./*.tgz  -C /mining \
    && rm *.tgz

RUN apt-get update && apt-get -y upgrade && add-apt-repository ppa:oibaf/graphics-drivers

#RUN reboot

WORKDIR /mining/teamredminer-v0.9.4.2-linux

ADD init.sh /mining/teamredminer-v0.9.4.2-linux

#CMD ["/bin/bash", "reboot"]

CMD ["/bin/bash", "init.sh"]