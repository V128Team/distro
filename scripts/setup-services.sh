#!/bin/bash

systemctl disable getty@tty1.service
systemctl disable agetty@tty1.service
systemctl disable agetty@tty2.service
systemctl disable agetty@tty3.service
systemctl disable agetty@tty4.service
systemctl disable agetty@tty5.service
systemctl disable agetty@tty6.service

systemctl enable systemd-networkd
