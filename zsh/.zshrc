# === History ===

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# === Shell Behaviour ===

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zstyle ':completion:*' menu select # Arrow-key menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A_Z}' # Case-insensitive matching

setopt NOBEEP
setopt AUTOCD
setopt CORRECT # Zsh asks when wrong command
# setopt GLOB_DOTS # Dotfiles come up in autocomplete

export GPG_TTY=$(tty)

bindkey -v

# === Aliases ===

alias vim=nvim

# === Starship ===

eval "$(starship init zsh)"
