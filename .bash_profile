#!/bin/bash

# Do the following once per login shell.

# check if ssh-agent already running.  MacOS does this for me by adding 
# sh-agent to launchd and configuring it to restart on crashes.  Linux
# does require a bit more work...


# auto load ssh keys
ssh-add -A


# source .bashrc only if this is a VT or SSH connection
test -t 0 && source ~/.bashrc


