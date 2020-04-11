# Check of default cert for this user already exists (~/.ssh/id_rsa)
#  Create it using defaults if it is missing.   Don't overwrite if it exists.
if [ ! -e ~/.ssh/id_rsa ]; then
	cat /dev/zero | ssh-keygen -q -N ""  >/dev/null
fi



# Assume ssh-agent is already running.   use other system means to start it.
case $OSTYPE in
  darwin*)
    # manualy ssh-add -K key to add in mac keychain
    ssh-add -A  2> /dev/null
	;;
  *)
    for file in `grep -lR "PRIVATE" ~/.ssh/id_rsa*`; do ssh-add -q "$file" </dev/null 2>/dev/null ; done
	;;
esac


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o default -o nospace -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
