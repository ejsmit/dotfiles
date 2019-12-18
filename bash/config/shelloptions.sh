# Exit if not interactive
[[ $- == *i* ]] || return


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
