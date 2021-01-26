call plug#begin(stdpath('data') . '/vscode')
    Plug 'asvetliakov/vim-easymotion'
    Plug 'machakann/vim-sandwich'
    Plug 'unblevable/quick-scope'
call plug#end()

set clipboard+=unnamedplus " yank to clipboard

let g:EasyMotion_smartcase = 1 " turn on case-insensitive feature
nmap ' <Plug>(easymotion-prefix)
nmap 'l <Plug>(easymotion-bd-jk)

highlight OperatorSandwichBuns guifg='#aa91a0' gui=underline ctermfg=172 cterm=underline
highlight OperatorSandwichChange guifg='#edc41f' gui=underline ctermfg='yellow' cterm=underline
highlight OperatorSandwichAdd guibg='#b1fa87' gui=none ctermbg='green' cterm=none
highlight OperatorSandwichDelete guibg='#cf5963' gui=none ctermbg='red' cterm=none

highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

function! s:organizeFormat()
    call VSCodeNotify('editor.action.organizeImports')
    call VSCodeNotify('editor.action.format')
endfunction

nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>

" map space to leader
let mapleader = " "
nnoremap <space> <nop>

nmap <leader>/ <Plug>VSCodeCommentaryLine
xmap <leader>/ <Plug>VSCodeCommentary

nnoremap <C-Space> <Cmd>call VSCodeNotify('editor.action.triggerSuggest')<CR>

nnoremap <leader>- <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap <leader>\ <Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>
nnoremap <leader>d <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <leader>f <Cmd>call <SID>organizeFormat()<CR>
nnoremap <leader>i <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>
nnoremap <leader>o <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>s <Cmd>call VSCodeNotify('workbench.view.search')<CR>
nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>
nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>

nnoremap <leader>al <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>

" Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

