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
