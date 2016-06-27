#!/bin/sh
# paths
export PATH=~/.rbenv/shims:$PATH                 # RBENV
export PATH=/usr/local/bin:$PATH                 # homebrew
export PATH=/usr/local/bin:$PATH                 # homebrew
export PATH=/usr/local/sbin:$PATH                # homebrew
export PATH=~/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=/usr/local/bin/gem:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/bin:$PATH
#development
#
current_branch_name () {
  git branch | grep "*" | sed s/\*[^\d]//
}

current_branch_number () {
  current_branch_name | sed s/[^0-9]*_.*//
}

aheadof() {
  default_remote='production'

  remote=${1-$default_remote}

  fetch="$(git fetch $remote)"

  ahead="$(git rev-list $remote/master..HEAD --count)"

  echo "$ahead commits ahead of $remote/master"
}

gpr () {
  hub pull-request -i $(current_branch_number)
}

# http://apple.stackexchange.com/questions/55875/how-can-git-auto-complete-branches-at-the-terminal-command-line
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export FTP_HOST=localhost

export OPEN_GIT_PR=true # git pr 472 will now open in browser after it is done

export GIT_EDITOR="mvim -f"

# enables color for tests http://stackoverflow.com/questions/307783/how-do-i-enable-color-when-running-rspec-through-rstakeout
export AUTOTEST=true

# Allow us to open the proper library with bundle open command
export BUNDLER_EDITOR=mvim

# useful when running test suites locally or other things
export DEVELOPMENT=true
#aliases

alias ka="killall"

alias ag='ag --path-to-agignore ~/.agignore'

alias g="git"
alias ga="git add"
alias gd="git difftool -y"
alias gwd="git diff --word-diff"
alias gs="git status -sb"
alias gc="git commit"
alias gca="git commit -a"
alias ll="ls -las"
alias gl="git log --oneline --decorate"
alias g="git"
alias gps="git push"
alias gp="git pull"
alias rdm="git diff master --name-only | grep '.rb' | grep -v 'schema' | xargs rubocop"

alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|" # taken from http://coderwall.com/p/hvfvva

# rails
alias be="bundle exec"
alias ber="bundle exec rake"
alias bers="bundle exec rake spec"
alias berc="bundle exec rails console"
alias bes="bundle exec rspec"
alias r="bundle exec rails"
alias rs="bundle exec rails s"
alias psp="rake parallel:create; rake parallel:prepare; rake parallel:spec"
alias psps="rake parallel:spec"

# for rspec
alias rspec="rspec --color --format documentation"

function gex {
  git update-index --assume-unchanged $@
}

function gin {
  git update-index --no-assume-unchanged $@
}

function gdel {
  git status | awk '/deleted: (.*)/ {print $3}' | xargs git rm -f;
}

# https://gist.github.com/427815
# script/server with Rails 3 support
ss() {
  if [ -f ./script/rails ]; then
    ./script/rails server $@
  else
    ./script/server -e $@
  fi
}

# script/console with Rails 3 support
sc() {
  if [ -f ./script/rails ]; then
    ./script/rails console $@
  else
    ./script/console $@
  fi
}

# script/generate with Rails 3 support
sg() {
  if [ -f ./script/rails ]; then
    ./script/rails generate $@
  else
    ./script/generate $@
  fi
}

rr() {
  rake
  if [ $? -gt 0 ]; then
    say "Some tests failed."
    echo "Some tests failed."
  else
    say "All tests green."
    echo "All tests green."
  fi
}

# capistrano stuff: http://www.deprec.org/trac.cgi/wiki/UsageDocs
alias cap1="`which cap` _1.4.1_"
#environment
eval "$(rbenv init -)" # https://github.com/sstephenson/rbenv

export CLICOLOR=1
export MANPATH=/opt/local/share/man:$MANPATH
export HISTSIZE=5000

function title {
  echo -e "\033];$1\007"
}
#prompt

# Last, add git branch info.
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

bash_prompt() {
  case $TERM in
    xterm*|rxvt*)
      local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
      ;;
    *)
      local TITLEBAR=""
      ;;
  esac
  local NONE="\[\033[0m\]"  # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"  # black
  local R="\[\033[0;31m\]"  # red
  local G="\[\033[0;32m\]"  # green
  local Y="\[\033[0;33m\]"  # yellow
  local B="\[\033[0;34m\]"  # blue
  local M="\[\033[0;35m\]"  # magenta
  local C="\[\033[0;36m\]"  # cyan
  local W="\[\033[0;37m\]"  # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W         # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="\W $M\$(parse_git_branch)$NONE $UC\$$NONE "
}

bash_prompt
