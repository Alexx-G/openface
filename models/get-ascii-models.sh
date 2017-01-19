#!/bin/bash
#
# Download Torch models in ascii format and save them in binary format.

cd "$(dirname "$0")"

mkdir -p openface && cd openface

printf "\n\n====================================================\n"
printf "Downloading OpenFace models, which are copyright\n"
printf "Carnegie Mellon University and are licensed under\n"
printf "the Apache 2.0 License.\n\n"
printf "This will incur about 100MB of network traffic for the models.\n"
printf "====================================================\n\n"

wget -nv http://openface-models.storage.cmusatyalab.org/nn4.small2.v1.ascii.t7.xz \
  -O nn4.small2.v1.ascii.t7.xz
[ $? -eq 0 ] || ( rm nn4.small2.v1.t7.xz* && die "+ nn4.small2.v1.ascii.t7.xz: Error in wget." )
unxz nn4.small2.v1.ascii.t7.xz && \
./convert-ascii-model.lua nn4.small2.v1.ascii.t7 nn4.small2.v1.t7 && \
rm nn4.small2.v1.ascii.t7
