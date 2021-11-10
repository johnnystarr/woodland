FROM ubuntu:20.04

COPY ./ /build

RUN set -x \
    && apt-get update \
    && apt-get install -y \
        libncurses5-dev \
        cmake \
        make \
        build-essential \
        gcc

CMD ["make"]
