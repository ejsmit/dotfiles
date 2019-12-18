

path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="${PATH:+"$PATH:"}$1"
  fi
}

path_add_start() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1${PATH:+":$PATH"}"
  fi
}


# make sure a few required directories exist
mkdir -p ~/nextcloud
mkdir -p ~/projects
mkdir -p ~/.private
mkdir -p ~/bin

path_add $HOME/bin
path_add $HOME/.local/bin
