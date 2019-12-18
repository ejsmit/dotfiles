
alias g="git"

# Enable tab completion for `g` by marking it as an alias for `git`
complete -o bashdefault -o default -o nospace -F _git g;



# checkout & branch
alias gco='git checkout'
alias gcp='git checkout -p'
alias gb='git branch'

# add & commit
alias ga='git add'
# function gau = add untracked files
alias gap='git add -p'
alias gc='git commit'
alias gca='gc --amend'
alias gcs='git commit --allow-empty --squash'

# status & logs
alias gs='git status --untracked-files=all'
alias gl='glg $(git show-ref | cut -d " " -f 2 | grep -v stash$) HEAD'

# stash
alias gst='git stash --include-untracked --keep-index'
alias gstp='git stash pop'

# push & pull
alias gp='git push'
alias gpt='git push -u origin $(git_current_branch)'

# diff and merge
alias gd='git diff -M40'
alias gds='gd --cached'
alias gdt='git difftool --dir-diff'

# merge & rebase
alias gru='git rebase @{u}'
alias grc='git rebase --continue'


# reset
alias gar='git reset HEAD'
alias garp='git reset -p HEAD'





# git log
function git-log() {
  git log -M40 --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %C(green bold)- %an %C(black bold)%cd (%cr)%Creset' --abbrev-commit --date=short "$@"
}

function glg() {
  if [[ $# == 0 ]] && git rev-parse @{u} &> /dev/null; then
    git-log --graph @{u} HEAD
  else
    git-log --graph "$@"
  fi
}


# returns names of current branch
function git_current_branch()
{
  git symbolic-ref --short -q HEAD
}

# git add untracked
gau() {
  git ls-files --other --exclude-standard -z "$@" | xargs -0 git add -Nv
}
