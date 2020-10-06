FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends automake autoconf \
    pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ \
    zlib1g-dev git ca-certificates

RUN git clone https://github.com/zcoinofficial/cpuminer.git
WORKDIR cpuminer
RUN chmod +x autogen.sh build.sh
RUN ./build.sh