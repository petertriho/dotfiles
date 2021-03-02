if exists('g:vscode')
    " vscode extension
    runtime vscode.vim
else
    " ordinary neovim
    runtime config.vim
    runtime plugins.vim
    runtime theme.vim
    runtime coc.vim
    runtime keys.vim
endif

