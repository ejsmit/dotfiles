

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



# bash options

# Case-insensitive globbing (used in pathname expansion)
# Append to the Bash history file, rather than overwriting it
# Autocorrect typos in path names when using `cd`
# `**/qux` will enter `./foo/bar/baz/qux`
# Recursive globbing, e.g. `echo **/*.txt`
for option in nocaseglob histappend cdspell autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


# completion
case $OSTYPE in
  darwin*)
		# Add tab completion for many Bash commands
		if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
			source "$(brew --prefix)/share/bash-completion/bash_completion";
		elif [ -f /etc/bash_completion ]; then
			source /etc/bash_completion;
		fi;

		;;
	*)
		# usually already loaded

		;;
esac

# Enable tab completion for `g` by marking it as an alias for `git`
complete -o bashdefault -o default -o nospace -F _git g;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o default -o nospace -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


# make sure gocryptfs private directory exists
[[ ! -d ~/.private ]] && mkdir ~/.private

# Initialise osxfuse after reboot if device files does not exist
[[ $OSTYPE == darwin* ]] && [[ ! -e /dev/osxfuse0 ]] && /Library/Filesystems/osxfuse.fs/Contents/Resources/load_osxfuse
