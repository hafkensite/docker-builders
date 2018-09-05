hg clone http://asterisk.hosting.lv/hg asterisk-g72x
NUM=$(hg -R asterisk-g72x id -n)

HGUSER=x hg -R asterisk-g72x tag -r 20:ecc3fe501035 1.2
HGUSER=x hg -R asterisk-g72x tag -r 31:b67ce8dc7501 1.3

VER=$(hg -R asterisk-g72x log -r $NUM --template '{latesttag}+{latesttagdistance}+{node|short}\n')
tar zcf asterisk-g72x_$VER.orig.tar.gz --exclude='.hg*' \
  asterisk-g72x

rm -rf asterisk-g72x
tar zxf asterisk-g72x_$VER.orig.tar.gz
