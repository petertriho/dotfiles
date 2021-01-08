# dotfiles

## Installation

### Dependencies

#### GNU Stow

- MacOS (homebrew): `brew install stow`
- Arch (pacman): `sudo pacman -S stow`

### Instructions

1. `mkdir -p ~/.dotfiles`
2. `git clone https://github.com/petertriho/dotfiles.git ~/.dotfiles`
3. `stow --no-folding -t ~ */`

## Software

- [Bat](https://github.com/sharkdp/bat)
- [Delta](https://github.com/dandavison/delta)
- [Fish Shell](https://fishshell.com/)
- [Kitty Terminal](#kitty-terminal)
- [Neovim](https://neovim.io/)
- [Oni2](https://onivim.io/)
- [Ranger](https://github.com/ranger/ranger)
- [Tmux](https://github.com/tmux/tmux)
- [Vim](https://www.vim.org/)

### Fish Shell

#### Dependencies

- [starship](https://starship.rs/)
- [jorgeburcaran/fisher](https://github.com/jorgebucaran/fisher)
- [franciscolourenco/done](https://github.com/franciscolourenco/done)
- [wfxr/forgit](https://github.com/wfxr/forgit)
- [PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish)

### Kitty Terminal

#### Dependencies

- [dexpota/kitty-themes](https://github.com/dexpota/kitty-themes)  
`ln -s ~/.config/kitty/kitty-themes/themes/Brogrammer.conf ~/.config/kitty/theme.conf`

### Neovim

#### Dependencies

- [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
- [mbbill/undotree](https://github.com/mbbill/undotree)

### Tmux

#### Dependencies

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
