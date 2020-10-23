#!/bin/bash

adduser --gecos user \
        --disabled-password \
        --shell /bin/bash \
        user
adduser user sudo
echo "user:user" |chpasswd
