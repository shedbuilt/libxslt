#!/bin/sh
sed -i s/3000/5000/ libxslt/transform.c doc/xsltproc.{1,xml}
./configure --prefix=/usr \
            --disable-static \
            --without-python || return 1
make -j $SHED_NUM_JOBS || return 1
make DESTDIR="$SHED_FAKE_ROOT" install || return 1
