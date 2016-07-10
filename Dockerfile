FROM ubuntu:14.04

MAINTAINER Raymond Wen "rx.wen218@gmail.com"

# Install java8
#RUN apt-get install -y software-properties-common && add-apt-repository -y ppa:webupd8team/java && apt-get update
#RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
#RUN apt-get install -y oracle-java8-installer bsdtar

RUN apt-get update && apt-get install -y bison g++-multilib git gperf libxml2-utils make zlib1g-dev zip zlib1g libxml2-utils u-boot-tools
RUN curl https://storage.googleapis.com/git-repo-downloads/repo -o /usr/bin/repo && chmod +x /usr/bin/repo

# Cleaning
RUN apt-get clean
