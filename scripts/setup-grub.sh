#!/bin/bash

update-grub
grub-install --target=x86_64-efi --no-nvram
mkdir -p /boot/efi/EFI/BOOT
cp /boot/efi/EFI/vice/grubx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI
