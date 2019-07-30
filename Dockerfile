FROM alpine:3.8 as buildContainer

RUN  apk add --update --no-cache bash autoconf  automake make cmake libtool bison flex  g++  gmp-dev libuv-dev openssl-dev  && \
     \
     cd /tmp && wget https://github.com/apache/thrift/archive/0.11.0.zip -O thrift.zip  && unzip thrift.zip && cd thrift-0.11.0 && \
     ./bootstrap.sh && ./configure CFLAGS="-s -O2" CXXFLAGS="-s -O2"  --without-ruby --disable-tests --disable-debug --without-php_extension --without-python --without-haskell --without-java --without-perl --without-php --without-py3 --without-erlang && make && make install && \
     apk del --update --no-cache  autoconf  automake make cmake libtool bison flex  g++  gmp-dev libuv-dev openssl-dev   && \
     rm -rf /tmp/*
