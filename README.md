# dotfiles

## Installation

### Dependencies

#### GNU Stow

- MacOS (homebrew): `brew install stow`
- Arch (pacman): `sudo pacman -S stow`
- Ubuntu (apt): `sudo apt install stow`

### Instructions

1. `git clone https://github.com/petertriho/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles; stow --no-folding -t ~ */`

## Software

- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/)
- [Tmux](https://github.com/tmux/tmux)

### Fish Shell

#### Dependencies

- [starship](https://starship.rs/)
- [jorgeburcaran/fisher](https://github.com/jorgebucaran/fisher)
- [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide)
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- [dandavison/delta](https://github.com/dandavison/delta)
- [junegunn/fzf](https://github.com/junegunn/fzf)
- [sharkdp/bat](https://github.com/sharkdp/bat)
- [sharkdp/fd](https://github.com/sharkdp/fd)
- [sharkdp/vivid](https://github.com/sharkdp/vivid)

### Neovim

#### Dependencies

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
- [cli/cli](https://github.com/cli/cli)
- [sharkdp/fd](https://github.com/sharkdp/fd)
- `scripts/.local/bin/install_formatters_linters`
- `scripts/.local/bin/install_language_servers`

### Tmux

#### Dependencies

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
