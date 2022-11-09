# Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment variables
if [ -f ~/.config/zsh/exports.zsh ]; then
    . ~/.config/zsh/exports.zsh
fi

# ZSH configuration
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"

if [ ! -d $HOME/.cache/zsh ]; then
    mkdir -p $HOME/.cache/zsh
fi

DISABLE_AUTO_UPDATE=false
DISABLE_UPDATE_PROMPT=false
UPDATE_ZSH_DAYS=7

ZSH_THEME="powerlevel10k/powerlevel10k"

HIST_STAMPS="yyyy-mm-dd"
HISTFILE="${HOME}/.cache/zsh/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000

ZSH_COMPDUMP="${HOME}/.cache/zsh/zcompdump-${HOST}-${ZSH_VERSION}"

plugins=(git)

# Follow the PATH
if [ -f ~/.config/zsh/path.zsh ]; then
    . ~/.config/zsh/path.zsh
fi

# Loading some stuff
if [ -f ~/.config/zsh/aliases.zsh ]; then
    . ~/.config/zsh/aliases.zsh
fi

if [ -f ~/.config/homebrew/homebrew ]; then
    . ~/.config/homebrew/homebrew
fi

# Loading oh-my-zsh and powerlevel10k
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

