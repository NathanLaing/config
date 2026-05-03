eval "$(fnm env --use-on-cd --shell zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH exports
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$PATH:/Users/nathan/.local/bin"

## Other
export GPG_TTY=$(tty) # tells gpg which terminal to use
# ----------------------

# Zsh
export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 7

plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
# ----------------------

# nvim ssh switcher
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi
# ----------------------

# Completions and auto generated snippets
## Compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/nathan/.zshrc'
fpath+=~/.zfunc
autoload -Uz compinit
compinit
## ---------------------

## uv
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
## ---------------------
# ----------------------

# Edit command line in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=40

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# fnm
FNM_PATH="/home/nathan/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi

. "$HOME/.local/share/../bin/env"
