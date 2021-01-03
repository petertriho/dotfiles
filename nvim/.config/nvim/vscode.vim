call plug#begin(stdpath('data') . '/vscode')
    Plug 'asvetliakov/vim-easymotion'
    Plug 'tpope/vim-surround'
call plug#end()

set clipboard+=unnamedplus " yank to clipboard

let g:EasyMotion_smartcase = 1 " turn on case-insensitive feature
nmap ' <Plug>(easymotion-prefix)
nmap 'l <Plug>(easymotion-bd-jk)

" map space to leader
let mapleader = " "
nnoremap <space> <nop>

function! s:organizeFormat()
    call VSCodeNotify('editor.action.organizeImports')
    call VSCodeNotify('editor.action.format')
endfunction

nmap <leader>/ <Plug>VSCodeCommentaryLine
vmap <leader>/ <Plug>VSCodeCommentary

nnoremap <leader>f <Cmd>call <SID>organizeFormat()<cr>
nnoremap <leader>af <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>
nnoremap <C-Space> <Cmd>call VSCodeNotify('editor.action.triggerSuggest')<cr>
nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<cr>
nnoremap <leader>E <Cmd>call VSCodeNotify('workbench.view.explorer')<cr>
nnoremap <leader>r <Cmd>call VSCodeNotify('revealInExplorer')<cr>
nnoremap <leader>t <Cmd>call VSCodeNotify('workbench.action.togglePanel')<cr>
nnoremap <leader>l <Cmd>call VSCodeNotify('Notes.listNotes')<cr>
nnoremap <leader>n <Cmd>call VSCodeNotify('Notes.newNote')<cr>
nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<cr>

