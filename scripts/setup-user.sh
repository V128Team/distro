#!/bin/bash

adduser --gecos user \
        --disabled-password \
        --shell /bin/bash \
        user

adduser user adm
adduser user sudo
adduser user plugdev
passwd -d user
