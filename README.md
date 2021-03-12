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
- [Neovim](https://neovim.io/)
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

### Neovim

#### Dependencies

- [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
- [neoclide/coc-git](https://github.com/neoclide/coc-git)
- [koalaman/shellcheck](https://github.com/koalaman/shellcheck)
- [hadolint/hadolint](https://github.com/hadolint/hadolint)

### Tmux

#### Dependencies

- [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
