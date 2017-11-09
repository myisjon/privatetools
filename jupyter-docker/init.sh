#!/bin/bash

set -e

curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum update -y
yum install -y make gcc gcc-c++ zlib-devel openssl-devel \
               openssh-clients sshpass sqlite-devel python-devl

init_py_env() {
    mkdir -p /src && cd /src
    curl -O https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
    tar -xvf Python-3.6.3.tar.xz
    cd Python-3.6.3
    ./configure
    make -j4 && make install
    cd /src && rm -rf /src/Python-3.6.3
}

init_py_env

install_jupyter_env() {
    pip3 install -r /requirements.txt -i https://pypi.doubanio.com/simple/
}

install_jupyter_env

clean_os_env() {
    cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
       systemd-tmpfiles-setup.service ] || rm -f $i; done
    rm -f /lib/systemd/system/multi-user.target.wants/*
    rm -f /etc/systemd/system/*.wants/*
    rm -f /lib/systemd/system/local-fs.target.wants/*
    rm -f /lib/systemd/system/sockets.target.wants/*udev*
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*
    rm -f /lib/systemd/system/basic.target.wants/*
    rm -f /lib/systemd/system/anaconda.target.wants/*
}

clean_os_env

exec "$@"
