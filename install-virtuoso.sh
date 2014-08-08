#!/bin/bash
if [ ! -f virtuoso-opensource-7.1.0.zip ]; then
    wget https://github.com/openlink/virtuoso-opensource/archive/v7.1.0.zip -O virtuoso-opensource-7.1.0.zip
fi
unzip virtuoso-opensource-7.1.0.zip
mkdir virtuoso
cd virtuoso-opensource-7.1.0
./autogen.sh
./configure --prefix=/home/virtuoso/virtuoso
make
make install
mkdir /home/virtuoso/virtuoso/share/data