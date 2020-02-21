#!/bin/sh

echo "Setting up personal ZSH"

export GIT_EDITOR="mvim -f"

alias g="git"
alias ga="git add"
alias gd="git difftool -y -t Kaleidoscope"
alias gwd="git diff --word-diff"
alias gs="git status -sb"
alias gc="git commit"
alias gca="git commit -a"
alias ll="ls -last"
alias gl="git log --oneline --decorate"
alias g="git"
alias gps="git push"
alias gp="git pull"

# rails
alias be="bundle exec"
alias ber="bundle exec rake"
alias berc="bundle exec rails console"

function current_branch_name () {
  git branch | grep "*" | sed "s/\* //"
}

function current_merge_base () {
  git merge-base $(current_branch_name) master
}

function rebase_from_merge_base () {
  git rebase -i $(current_merge_base)
}


function foo () {
  echo "foo"
}

function bar () {
  $(foo) | sed "s/foo/baz/"
}
