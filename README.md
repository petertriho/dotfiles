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
- [wfxr/forgit](https://github.com/wfxr/forgit)
- [PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish)
- [sharkdp/vivid](https://github.com/sharkdp/vivid)
- [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide)

### Neovim

#### Dependencies

- [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)
- [cli/cli](https://github.com/cli/cli)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- `scripts/.local/bin/install_formatters_linters`
- `scripts/.local/bin/install_language_servers`

### Tmux

#### Dependencies

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
