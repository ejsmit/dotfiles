#!/usr/bin/env bash

mkdir -p ~/ssh-ca-temp
cp /etc/ssh/ssh_host_*_key.pub ~/ssh-ca-temp
ssh-keygen -s ~/.private/apps/ssh-ca/ca-key \
     -I "host:$(hostname)" \
     -n "$(hostname),$(hostname).local,$(hostname).home" \
     -V -5m:+3650d \
     -h \
     ~/ssh-ca-temp/ssh_host_rsa_key.pub \
     ~/ssh-ca-temp/ssh_host_ecdsa_key.pub \
     ~/ssh-ca-temp/ssh_host_ed25519_key.pub
sudo cp ~/ssh-ca-temp/ssh_host*-cert.pub /etc/ssh
rmdir ~/ssh-ca-temp
