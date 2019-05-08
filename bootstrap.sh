#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;


function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
	cp -f ~/nextcloud/dotfiles/dot.extra ~/.extra


	if [[ -f $HOME/.bash_profile ]]; then
		[[ -f $HOME/.bash_profile.old ]] && rm $HOME/.bash_profile.old
		mv $HOME/.bash_profile $HOME/.bash_profile.old
		echo "-------------------------------------------------------"
		echo ".bash_profile exists.  Renaming it to .bash_profile.old"
		echo "-------------------------------------------------------"
	fi

	source ~/.profile;

}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
