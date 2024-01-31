#!/bin/bash

cd /usr/lib

dnf install wget yum-utils make gcc openssl-devel bzip2-devel libffi-devel zlib-devel
wget https://www.python.org/ftp/python/3.10.8/Python-3.10.8.tgz

yum install sqlite-devel.x86_64

tar xzf Python-3.10.8.tgz && \
rm -r Python-3.10.8.tgz

cd Python-3.10.8 
./configure --with-system-ffi --with-computed-gotos --enable-loadable-sqlite-extensions 

make -j ${nproc} 
make altinstall 
