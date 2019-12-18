
case $OSTYPE in
  darwin*)
		# gocryptfs mount/unmount
		alias priv="gocryptfs -q ~/nextcloud/private ~/.private"
		alias nopriv="umount ~/.private"
    ;;
  *)
		# gocryptfs mount/unmount
		alias priv="gocryptfs -q ~/nextcloud/private ~/.private"
	  alias nopriv="fusermount -u ~/.private"
    ;;
esac
