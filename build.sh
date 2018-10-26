#!/bin/sh
# Patch
sed -i s/3000/5000/ libxslt/transform.c doc/xsltproc.{1,xml} &&
# Configure
./configure --prefix=/usr \
            --disable-static \
            --without-python &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install
