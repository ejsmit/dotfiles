#!/usr/bin/env bash

# exit when any command fails
set -e




function generate_all {
	ssh-keygen -s ~/.private/apps/ssh-ca/ca-key \
	     -I "host:$(hostname)" \
	     -n "$(hostname),$(hostname).local,$(hostname).home" \
	     -V -5m:+365d \
	     -h \
	     -z +$serial \
	     $temp_dir/ssh_host_*_key.pub
	count_certs=$(ls $temp_dir/ssh_host_*-cert.pub | wc -l)
	((serial=serial+$count_certs))	
}

function generate_single {
    for keyfile in $temp_dir/ssh_host_*_key.pub; do
		ssh-keygen -s ~/.private/apps/ssh-ca/ca-key \
		     -I "host:$(hostname)" \
		     -n "$(hostname),$(hostname).local,$(hostname).home" \
		     -V -5m:+365d \
		     -h \
		     -z +$serial \
		     $keyfile
		((serial=serial+1))	
    done	
}


temp_dir=$(mktemp -d)
cp /etc/ssh/ssh_host_*_key.pub $temp_dir

serial=$(cat ~/.private/apps/ssh-ca/ca-key.serial.txt)
#echo "First serial to use: $serial"
count=$(ls $temp_dir/ssh_host_*_key.pub | wc -l)
#echo "Number of key files: $count"

if [[ $1 == single ]]; then
	generate_single
else
	generate_all
fi
#echo "New serial to write $serial"
echo $serial >~/.private/apps/ssh-ca/ca-key.serial.txt

sudo cp $temp_dir/ssh_host*-cert.pub /etc/ssh
rm -Rf $temp_dir


