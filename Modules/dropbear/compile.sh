#!/usr/bin/env bash
export CFLAGS="-muclibc -O3 -DDEBUG_TRACE -DFAKE_ROOT "
export CPPFLAGS="-muclibc -O3"
export LDFLAGS="-muclibc -O3"

if [ ! -d dropbear ]
then
	hg clone https://secure.ucc.asn.au/hg/dropbear
fi
cd dropbear/
autoconf; autoheader
make clean
./configure --host=mips-linux --disable-zlib
make PROGRAMS="dropbear dbclient scp dropbearkey dropbearconvert" MULTI=1 SCPPROGRESS=1

cp dropbearmulti ${INSTALL}/bin
