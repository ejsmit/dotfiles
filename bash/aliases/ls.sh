
# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
 colorflag="--color"
 eval "`dircolors -b`"
else # macOS `ls`
 colorflag="-G"
 export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

alias ls="command ls ${colorflag} --file-type"
alias ll="ls -l "
alias la="ls -la "
alias lsd="ls -l | grep --color=never '^d'"
