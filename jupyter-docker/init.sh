#!/bin/bash

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

mkdir -p /root/.pip
cat >> /root/.pip/pip.conf << END
[global]
index-url=https://pypi.doubanio.com/simple/
# index-url = https://pypi.python.org/simple/

[list]
format=columns
END

exec "$@"
