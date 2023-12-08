FROM ubuntu:22.04

ARG VERSION

RUN apt-get update && \
    apt-get install -y wget tar libicu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /download

RUN wget https://dl.qubic.li/downloads/qli-Client-${VERSION}-Linux-x64.tar.gz

RUN tar -zxvf qli-Client-${VERSION}-Linux-x64.tar.gz

WORKDIR /app

RUN cp /download/qli-Client /app/ && rm -rf /download

VOLUME /app

ENTRYPOINT ["./qli-Client"]
