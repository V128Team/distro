#!/bin/bash

USER_GROUPS=(
    adm
    audio
    bluetooth
    dialout
    disk
    games
    input
    plugdev
    render
    staff
    sudo
    users
    video
)

adduser --gecos user \
        --disabled-password \
        --shell /bin/bash \
        user

for grp in "${USER_GROUPS[@]}"; do
    adduser user "${grp}"
done

passwd -d user

# Setup homedir
cp -r /user /home/
chown -R user:user /home/user
rm -rf /user
