FROM debian:jessie

RUN apt-get update
RUN apt-get install -y git wget pkg-config help2man libgsl0-dev libncurses5-dev libpcap-dev libsctp-dev libssl-dev dpkg-dev debhelper
RUN apt-get install -y vim patch

RUN wget -O /sipp_3.5.2.orig.tar.gz \
      https://github.com/SIPp/sipp/releases/download/v3.5.2/sipp-3.5.2.tar.gz
RUN tar zxf /sipp_3.5.2.orig.tar.gz

WORKDIR /sipp-3.5.2
RUN git clone https://github.com/SIPp/sipp-deb debian
RUN mkdir debian/patches

ADD ./g722-rtp.patch debian/patches
RUN echo "g722-rtp.patch" >> debian/patches/series
ADD ./ilbc-rtp.patch debian/patches
RUN echo "ilbc-rtp.patch" >> debian/patches/series
RUN DEB_BUILD_OPTIONS=parallel=4 dpkg-buildpackage -us -uc -sa
RUN cp sipp /usr/bin
