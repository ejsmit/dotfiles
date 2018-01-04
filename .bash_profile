#!/bin/bash

# Do the following once per login shell.
# apparently MacOS every single shell is a login shell.....

# check if ssh-agent already running.  MacOS does this for me by adding
# sh-agent to launchd and configuring it to restart on crashes.  Linux
# does require a bit more work...
case $OSTYPE in
  darwin*)
    # manualy ssh-add -K key to add in mac keychain
    ssh-add -A  2> /dev/null
		;;
	*)
    # This works for linux....
    ssh-add -l &>/dev/null
    if [ "$?" == 2 ]; then
      test -r ~/.ssh-agent && \
        eval "$(<~/.ssh-agent)" >/dev/null

      ssh-add -l &>/dev/null
      if [ "$?" == 2 ]; then
        (umask 066; ssh-agent > ~/.ssh-agent)
        eval "$(<~/.ssh-agent)" >/dev/null
        grep -R "PRIVATE" ~/.ssh/ | xargs ssh-add
      fi
    fi
		;;
esac



# source .bashrc only if this is a VT or SSH connection
test -t 0 && source ~/.bashrc
