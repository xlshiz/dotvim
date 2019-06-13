#!/bin/sh

#CFLAGS='-g -O0' CPPFLAGS='-I/usr/include/python3.3m -I/usr/include/i386-linux-gnu/python3.3m' \
#CPPFLAGS='-I/usr/include/python3.3m -I/usr/include/i386-linux-gnu/python3.3m' \
./configure \
--with-features=huge \
--with-compiledby="yourname" \
--enable-multibyte \
--enable-gui=gtk2 \
--enable-pythoninterp=yes \
# --enable-python3interp=yes \
# --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-i386-linux-gnu \
--enable-luainterp=yes \
#--with-lua-prefix=/usr --with-luajit \
#--enable-rubyinterp=yes \
--enable-perlinterp=auto \
--enable-sniff \
--enable-gpm \
--enable-cscope \
--enable-fontset \
--with-x \
--enable-fail-if-missing
