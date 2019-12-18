

# Required for gpg-agent
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"
