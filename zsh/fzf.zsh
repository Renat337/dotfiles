# Ctrl T uses fd
export FZF_CTRL_T_COMMAND='fd --type f --strip-cwd-prefix'

# Compact UI
export FZF_CTRL_T_OPTS="
 --height 40%
 --layout=reverse
 --border
 --preview 'bat --style=numbers --color=always {}'
"

# Start search from top
export FZF_CTRL_R_OPTS="
 --height 40%
 --layout=reverse
 --border
"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
 --walker-skip .git,node_modules,target
 --preview 'eza --tree --icons {}'
 --border
"

source <(fzf --zsh)
