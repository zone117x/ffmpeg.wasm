#!/bin/bash

set -euo pipefail

CONF_FLAGS=(
  --prefix=$INSTALL_DIR                               # install library in a build directory for FFmpeg to include
  --host=i686-gnu                                     # use i686 linux
  --enable-shared=no
  --disable-shared
  --disable-simd
  --enable-static
)

ls -al

./autogen.sh && emconfigure ./configure "${CONF_FLAGS[@]}"
emmake make install -j
