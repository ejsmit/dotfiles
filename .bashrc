# Exit if not interactive
[[ $- == *i* ]] || return



# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,path,aliases,functions,bash_prompt,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# bash options

# Case-insensitive globbing (used in pathname expansion)
# Append to the Bash history file, rather than overwriting it
# Autocorrect typos in path names when using `cd`
# `**/qux` will enter `./foo/bar/baz/qux`
# Recursive globbing, e.g. `echo **/*.txt`
for option in nocaseglob histappend cdspell autocd globstar checkwinsize; do
	shopt -s "$option" 2> /dev/null;
done;

# Increase Bash history size.
HISTSIZE=10000
HISTFILESIZE=10000;
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth



# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable tab completion for `g` by marking it as an alias for `git`
complete -o bashdefault -o default -o nospace -F _git g;


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o default -o nospace -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Initialise osxfuse after reboot if device files does not exist
[[ $OSTYPE == darwin* ]] && [[ ! -e /dev/osxfuse0 ]] && /Library/Filesystems/osxfuse.fs/Contents/Resources/load_osxfuse

# make sure gocryptfs private directory exists
[[ -d ~/.private ]] || mkdir ~/.private


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

# this is not the correct way to configure miniconda.  it requires 'conda init'
# but that does not work for version controlled dotfiles and different usernames.
# system python still default until you 'conda activate'
[[ -d ~/miniconda3/etc/profile.d/conda.sh ]] && . ~/miniconda3/etc/profile.d/conda.sh;

# Enable a nicer reverse search experience.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
