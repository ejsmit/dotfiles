#!/usr/bin/env bash

# exit when any command fails
set -e

echo "Creating new user key:"
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

serial=$(cat ~/.private/apps/ssh-ca/ca-key.serial.txt)
# echo "First serial to use: $serial"

echo "Signing key using CA private key"
ssh-keygen -s ~/.private/apps/ssh-ca/ca-key \
    -I "user:$(whoami)@$(hostname)" \
    -n "user-$(whoami)" \
    -V -5m:+365d \
    -z $serial \
    ~/.ssh/id_ed25519.pub

((serial=serial+1))
#echo "New serial to write $serial"
echo $serial >~/.private/apps/ssh-ca/ca-key.serial.txt

