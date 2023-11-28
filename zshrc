alias ll="ls -lasF"

# For VIM to ignore files from .gitignore
export FZF_DEFAULT_COMMAND='rg --files'

# Flutter stuff
export PATH="$PATH":"$HOME/.pub-cache/bin"
# 
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/lib:$PATH

export EDITOR="mvim -f"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# get personal zsh stuff in here
source ~/dotfiles/personal.zsh


# Dev specific on that machines  (this is not stored in dotfiles repo)
if [ -f ~/.development.sh ]; then
    source ~/.development.sh
fi
