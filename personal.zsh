source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export GIT_EDITOR="mvim -f"

alias g="git"
alias ga="git add"
alias gd="git difftool -y -t Kaleidoscope"
alias gwd="git diff --word-diff"
alias gs="git status -sb"
alias gc="git commit"
alias gca="git commit -a"
alias ll="ls -last -G"
alias gl="git log --oneline --decorate"
alias g="git"
alias gps="git push"
alias gp="git pull"

# rails
alias be="bundle exec"
alias ber="bundle exec rake"
alias berc="bundle exec rails console"


function default_branch () {
  git symbolic-ref refs/remotes/origin/HEAD | awk -F/ '{print $NF}'
}

function current_branch_name () {
  git branch | grep "*" | sed "s/\* //"
}

function review_current_branch_files () {
  git diff --name-only $(default_branch)..$(current_branch_name) | xargs studio
}

function review_current_branch_diff () {
  git difftool -y -t Kaleidoscope $(default_branch)..$(current_branch_name)
}

function review_current_branch_log () {
  git log --oneline $(default_branch)..$(current_branch_name)
}

alias gdo=review_current_branch_files
alias gdb=review_current_branch_diff
alias gdl=review_current_branch_log

function current_merge_base () {
  git merge-base $(current_branch_name) $(default_branch)
}

function rebase_from_merge_base () {
  git rebase -i $(current_merge_base)
}

# Last, add git branch info.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
