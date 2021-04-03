FROM ubuntu:16.04

MAINTAINER Raymond Wen "rx.wen218@gmail.com"

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y \
        bison g++-multilib gcc-multilib libudev-dev libxml2-utils zlib1g autoconf \
        libjpeg-dev libx11-dev libxext-dev libssl-dev zip flex make python zsh \
        libexpat1-dev curl wget git libc6-i386 libstdc++6:i386 zlib1g-dev:i386 \
        u-boot-tools libssl-dev lzop bc gperf mtd-utils expect device-tree-compiler \
        lcov clang-format-6.0 clang-tidy-6.0 libsqlite3-dev software-properties-common \
        net-tools iputils-ping libasound2-dev libncurses-dev
RUN ln -s /usr/bin/clang-format-6.0 /usr/bin/clang-format
RUN ln -s /usr/bin/clang-6.0 /usr/bin/clang
RUN ln -s /usr/bin/clang-tidy-6.0 /usr/bin/clang-tidy
ADD jdk1.6.0_45.tgz /opt/
ENV JAVA_HOME /opt/jdk1.6.0_45
ENV PATH $PATH:$JAVA_HOME/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo -o /usr/bin/repo && chmod +x /usr/bin/repo
RUN curl https://musl.cc/arm-linux-musleabi-cross.tgz | tar zxv
RUN mv arm-linux-musleabi-cross /opt
ENV PATH $PATH:/opt/arm-linux-musleabi-cross/bin

RUN apt-get install -y g++-multilib
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update
RUN apt-get install git -y
