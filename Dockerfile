FROM ubuntu:24.04

WORKDIR /tmp/

RUN ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

RUN apt -y update && apt -y upgrade \
    && apt install -y wget

RUN wget -P /tmp https://apt.kitware.com/kitware-archive.sh
RUN bash ./kitware-archive.sh

RUN apt -y update && apt -y upgrade \
    && apt install -y --no-install-recommends \
    cmake-data=3.30.6-0kitware1ubuntu24.04.1 \
    cmake=3.30.6-0kitware1ubuntu24.04.1 \
    build-essential \
    bzip2 \
    git \
    gdb \
    gcc=4:13.2.0-7ubuntu1 \
    g++=4:13.2.0-7ubuntu1 \
    unzip

RUN wget -P /tmp https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz
RUN tar -xf arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-eabi.tar.xz --strip-components=1 -C /opt
RUN wget -P /tmp https://github.com/ninja-build/ninja/releases/download/v1.12.1/ninja-linux.zip
RUN unzip ninja-linux.zip -d /usr/bin
ENV PATH="/opt/bin:${PATH}"
RUN rm -rfd /tmp/*

USER ubuntu
