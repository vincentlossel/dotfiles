# Load ZSH-Completions
FPATH+="${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src"
autoload -Uz compinit
compinit

# Brew completions
if type brew &>/dev/null
then
    FPATH+="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

