# === Core ===

alias vim=nvim

# === Modern CLI Replacements ===

# Eza
alias ls='eza --icons'
alias ll='eza -lh --icons --git'
alias lh='eza -lah --icons --git'
alias tree='eza --tree --icons'

compdef eza=ls
