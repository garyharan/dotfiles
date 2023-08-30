source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

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

function current_branch_name () {
  git branch | grep "*" | sed "s/\* //"
}

function current_merge_base () {
  git merge-base $(current_branch_name) master
}

function rebase_from_merge_base () {
  git rebase -i $(current_merge_base)
}

# Last, add git branch info.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Taken from : https://github.com/asdf-vm/asdf-erlang/issues/207#issuecomment-883216342
export KERL_CONFIGURE_OPTIONS="--with-ssl=`brew --prefix openssl` \
                               --with-wx-config=`brew --prefix wxmac`/bin/wx-config \
                               --without-javac"
