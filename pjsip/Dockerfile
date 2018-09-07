FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y tar bzip2 curl build-essential
RUN curl -Ss http://www.pjsip.org/release/2.8/pjproject-2.8.tar.bz2 | tar -xjv 
WORKDIR /pjproject-2.8
RUN apt-get install -qy libopus-dev libssl-dev pkg-config uuid-dev libasound2-dev
RUN ./configure --disable-video 
RUN make dep
RUN make clean
RUN make
