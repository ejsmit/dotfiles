
# Make vim the default editor.
export EDITOR='nano';

# Prefer UK English and use UTF-8.
export LANG='en_GB.UTF-8';
export LC_ALL='en_GB.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# password prompts for SSH
[[ $XDG_CURRENT_DESKTOP == "KDE" ]] && export SSH_ASKPASS=ksshaskpass


# python disable prompt changes
export VIRTUAL_ENV_DISABLE_PROMPT=1

