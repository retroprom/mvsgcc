
ARG BASE="debian:stable"

FROM ${BASE}

ENV MVSGCC_PKG="build-essential gcc gcc-multilib libc6-dev make"

RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends ${MVSGCC_PKG} \
 && apt clean && rm -rf /var/lib/apt/lists/*

COPY ./ /build/

WORKDIR /build

RUN make -j2

