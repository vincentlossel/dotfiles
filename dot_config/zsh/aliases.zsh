#!/usr/bin/env zsh

# Python
alias python="python3"
alias py="python3"
alias pip="pip3"

# nvim everywhere
alias vim="nvim"
alias vi="nvim"
alias nano="nvim"

# Shortcuts
alias dev="cd ~/Developer"
alias projects="cd ~/Developer/Projects/"
alias docs="cd ~/Documents"
alias notes="cd ~/Documents/Notes/"
alias desk="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias config="cd ~/.config"

alias g="git"
alias lg="lazygit"

# unalias l
alias l="exa -la"

# yazi
alias yz="yazi"

# Cleanup
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# https://xkcd.com/530/
alias stfu="osascript -e 'set volume muted tru'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# AFK
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# Show each path on a new line
alias path="echo -e ${PATH//:/$'\n'}"

# Homebrew
alias brup="brew update && brew upgrade && brew cleanup"
