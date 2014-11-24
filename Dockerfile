FROM debian:jessie

RUN apt-get update && apt-get install -y \
    clang \
    g++ \
    automake \
    gettext

COPY . /znc
WORKDIR /znc

RUN apt-get install -y pkg-config make libssl-dev
RUN ./autogen.sh
RUN ./configure && make && make install
USER 1
ENTRYPOINT ["znc"]
