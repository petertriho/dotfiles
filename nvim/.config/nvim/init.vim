if exists('g:vscode')
    " vscode extension
    source $HOME/.config/nvim/vscode.vim
else
    " ordinary neovim
    source $HOME/.config/nvim/config.vim
    source $HOME/.config/nvim/plugins/init.vim
    source $HOME/.config/nvim/keys/init.vim
endif

