# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keep history for a long time: https://www.soberkoder.com/better-zsh-history/
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "

alias ll="ls -lasF"

# For VIM to ignore files from .gitignore
export FZF_DEFAULT_COMMAND='rg --files'

# Flutter stuff
export PATH="$PATH":"$HOME/.pub-cache/bin"
# 
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/lib:$PATH

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# get personal zsh stuff in here
source ~/dotfiles/personal.zsh


# Dev specific on that machines  (this is not stored in dotfiles repo)
if [ -f ~/.development.sh ]; then
    source ~/.development.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
