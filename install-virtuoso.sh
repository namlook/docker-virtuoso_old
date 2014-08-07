#!/bin/bash
unzip virtuoso-opensource-7.1.0.zip
mkdir virtuoso
cd virtuoso-opensource-7.1.0
./autogen.sh
./configure --prefix=/home/virtuoso/virtuoso
make
make install
mkdir /home/virtuoso/virtuoso/share/data