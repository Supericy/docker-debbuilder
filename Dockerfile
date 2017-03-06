FROM ubuntu:16.04

ENV BUILD_DIR="/build"
ENV SOURCE_DIR="/source"
ENV OUTPUT_DIR="/output"

USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  build-essential \
  make \
  debhelper \
  sudo \
  rsync

RUN mkdir -p $BUILD_DIR && chmod +rw $BUILD_DIR
COPY build.sh $BUILD_DIR
RUN chmod +x $BUILD_DIR/build.sh

VOLUME $SOURCE_DIR
VOLUME $OUTPUT_DIR

CMD cd $BUILD_DIR && ./build.sh
