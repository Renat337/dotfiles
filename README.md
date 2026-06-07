# Dotfiles

## Installation
- Clone the repo somewhere using `git clone --recurse-submodules https://github.com/Renat337/dotfiles`
- Symlink each directory into ~/.config (unless you have nothing else in .config then you can directly put it there) eg. `ln -s ~/dotfiles/zsh ~/.config/zsh`
- Install dependencies below

## Dependencies
### Zsh
- zsh
- starship

#### Note
For Zsh, you will need to either make your `/etc/zshenv` file into:
```
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

or move the standard `.zshenv` into `~`.

### Neovim
- nvim
- node (for lsp servers)
- tree-sitter (but this is a nvim dependency installed by brew)
- tree-sitter-cli

### Tmux
- tmux

### Kitty
- kitty
