FROM debian:stretch
RUN apt-get update

RUN apt-get update -qq \
 && apt-get install -qqy --no-install-recommends gnupg ca-certificates apt-transport-https \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# COPY VoIPGRID repo to apt sources.
RUN echo "\
deb https://apt-dev.voipgrid.nl/debian stretch main testing unstable\n\
" > /etc/apt/sources.list.d/voipgrid.list
COPY voipgrid.pref /etc/apt/preferences.d/voipgrid.pref

# And its key.
COPY packages_voipgrid_pub.gpg /tmp/packages_voipgrid_pub.gpg
RUN apt-key add /tmp/packages_voipgrid_pub.gpg

# Replace all repos with the OSSO proxy.
RUN sed -i -e '\
      s#httpredir.debian.org#apt.osso.nl#; \
      s#ftp.nl.debian.org#apt.osso.nl#; \
      s#deb.debian.org#apt.osso.nl#; \
      s#security.debian.org#apt.osso.nl/debian-security#; \
    ' /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -qy --no-install-recommends mercurial git dpkg-dev vim debhelper pkg-config curl wget unzip build-essential
RUN apt-get install -qy --no-install-recommends asterisk-dev=1:13.22.0-13vg6~d9

# Build the bcg729 debian package as described by OSSO
ENV BCG729_VER=1.0.4
RUN curl -Ss https://codeload.github.com/BelledonneCommunications/bcg729/tar.gz/$BCG729_VER >bcg729_$BCG729_VER.orig.tar.gz
RUN tar zxf bcg729_$BCG729_VER.orig.tar.gz

WORKDIR /bcg729-$BCG729_VER
RUN git clone https://github.com/ossobv/bcg729-deb.git debian
RUN dpkg-buildpackage -us -uc -sa 

# Build the g72x Astersk package
WORKDIR /
COPY fetch-source.sh /
RUN /fetch-source.sh
COPY asterisk-g72x-deb /asterisk-g72x/debian

ENV BCG729_DEB_VER=$BCG729_VER-0osso1+deb9
RUN dpkg -i /libbcg729-dev_${BCG729_DEB_VER}_amd64.deb /libbcg729-0_${BCG729_DEB_VER}_amd64.deb
WORKDIR /asterisk-g72x
RUN dpkg-buildpackage -us -uc -sa 
ADD copy-artifacts.sh /copy-artifacts.sh
CMD /copy-artifacts.sh
