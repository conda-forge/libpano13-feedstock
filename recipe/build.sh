# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./config
set -ex

./configure \
    --prefix=${PREFIX} \
    --with-zlib=${PREFIX} \
    --with-java=${JAVA_HOME}

# p2c and c2p functions are all deprecated
# but this code makes use of them.
# you can enable them on OSX if you define this variable
export CPPFLAGS="${CPPFLAGS} -DOLDP2C"
make -j${CPU_COUNT}

make install
