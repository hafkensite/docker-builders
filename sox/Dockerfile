from alpine:3.8
run apk add --no-cache git ca-certificates autoconf automake libtool build-base opus-dev opus libvorbis-dev lame-dev gcc
run git clone https://git.code.sf.net/p/sox/code sox
workdir sox
run git checkout sox-14.4.2
run sed -i.bak 's/#error FIX NEEDED HERE/\/\/ FIXED/' src/formats.c
run autoreconf -i
run ./configure --enable-static=yes --enable-shared=no --without-libltdl || cat config.log 
run make -s
run make install
