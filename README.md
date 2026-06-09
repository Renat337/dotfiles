# Dotfiles

## Installation

1. Clone the repo:
   ```sh
   git clone --recurse-submodules https://github.com/Renat337/dotfiles
   ```

2. Symlink each directory into `~/.config/`:
   ```sh
   ln -s ~/dotfiles/zsh ~/.config/zsh
   ln -s ~/dotfiles/nvim ~/.config/nvim
   ln -s ~/dotfiles/tmux ~/.config/tmux
   ln -s ~/dotfiles/kitty ~/.config/kitty
   ```

3. Create required directories:
   ```sh
   mkdir -p ~/.cache/zsh
   mkdir -p ~/.local/state/zsh
   ```

4. Set up the zsh bootstrap — create `~/.zshenv` with:
   ```sh
   export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
   export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
   ```
   This is the one file that must live in `$HOME`. It tells zsh to read all config from `~/.config/zsh/` instead.

   Alternatively, if you have root access and are the only user, you can put this in `/etc/zshenv` instead for a completely clean home directory.

5. Install dependencies below.

## Dependencies

### Zsh
- zsh
- starship
- fzf
- zoxide
- rigpgrep
- fd
- bat
- eza

### Neovim
- nvim
- node (for LSP servers)
- tree-sitter
- tree-sitter-cli

### Tmux
- tmux

### Kitty
- kitty
