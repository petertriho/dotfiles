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

- [Bat](https://github.com/sharkdp/bat)
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
- [sharkdp/vivid](https://github.com/sharkdp/vivid)

### Kitty Terminal

#### Dependencies

- [dexpota/kitty-themes](https://github.com/dexpota/kitty-themes)
`ln -s ~/.config/kitty/kitty-themes/themes/OneDark.conf ~/.config/kitty/theme.conf`

### Neovim

#### Dependencies

- [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
- [mbbill/undotree](https://github.com/mbbill/undotree)
- [neoclide/coc-git](https://github.com/neoclide/coc-git)
- [koalaman/shellcheck](https://github.com/koalaman/shellcheck)
- [hadolint/hadolint](https://github.com/hadolint/hadolint)

### Tmux

#### Dependencies

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
