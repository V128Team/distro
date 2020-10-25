#!/bin/bash

function die
{
    echo "`$@` exited with error code $?"
    exit 1
}

function try
{
    echo "$@"
    "$@" || die "$@"
}

KERNEL_IMAGE=$(basename $(readlink /vmlinuz))
INITRD_IMAGE=$(basename $(readlink /initrd.img))
LOADER_FILE=/boot/efi/loader/entries/vice-embedded.conf

try mkdir -p /boot/efi/loader/entries
try cp /vmlinuz /boot/efi
try cp /initrd.img /boot/efi

cat > $LOADER_FILE <<EOF
title VICE Embedded
linux  /vmlinuz
initrd /initrd.img
options root=LABEL=root splash quiet loglevel=3 vga=current vt.global_cursor_default=0 i915.fastboot=1 virtio.fastboot=1
EOF

try cat $LOADER_FILE
try bootctl install
