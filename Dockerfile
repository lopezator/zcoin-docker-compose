FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends automake autoconf \
    pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ \
    zlib1g-dev git ca-certificates

RUN apt-get update && apt-get install -y --no-install-recommends git build-essential \
    cmake libuv1-dev libssl-dev libhwloc-dev
RUN git clone https://github.com/xmrig/xmrig.git
WORKDIR xmrig
RUN mkdir xmrig/build
RUN cmake .
RUN make -j$(nproc)

