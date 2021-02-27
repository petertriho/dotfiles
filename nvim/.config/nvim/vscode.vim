call plug#begin(stdpath('data') . '/vscode')
Plug 'asvetliakov/vim-easymotion'
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-highlightedyank'
Plug 'unblevable/quick-scope'
call plug#end()

set clipboard+=unnamedplus " yank to clipboard
set lazyredraw             " speed up macros

let g:EasyMotion_smartcase = 1 " turn on case-insensitive feature
nmap \ <Plug>(easymotion-prefix)
nmap \l <Plug>(easymotion-bd-jk)

let g:highlightedyank_highlight_duration = 300

highlight HighlightedyankRegion guibg='#98c379' gui=none ctermbg='green' cterm=none

highlight OperatorSandwichBuns guifg='#c678dd' gui=underline ctermfg='blue' cterm=underline
highlight OperatorSandwichChange guifg='#e5c07b' gui=underline ctermfg='yellow' cterm=underline
highlight OperatorSandwichAdd guibg='#98c379' gui=none ctermbg='green' cterm=none
highlight OperatorSandwichDelete guibg='#e06c75' gui=none ctermbg='red' cterm=none

highlight QuickScopePrimary guifg='#98c379' gui=underline ctermfg='green' cterm=underline
highlight QuickScopeSecondary guifg='#e06c75' gui=underline ctermfg='red' cterm=underline

nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>

" map space to leader
let mapleader = " "
nnoremap <space> <nop>

xmap gc <Plug>VSCodeCommentary
nmap gc <Plug>VSCodeCommentary
omap gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
nmap <leader>/ <Plug>VSCodeCommentaryLine

nnoremap <C-Space> <Cmd>call VSCodeNotify('editor.action.triggerSuggest')<CR>

nnoremap <leader><space> <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <leader>; <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>- <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap <leader>\ <Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>
nnoremap <leader>d <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <leader>f <Cmd>call VSCodeNotify('editor.action.format')<CR>
nnoremap <leader>i <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>
nnoremap <leader>o <Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>
nnoremap <leader>s <Cmd>call VSCodeNotify('workbench.view.search')<CR>
nnoremap <leader>q <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nnoremap <leader>Q <Cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>

nnoremap <leader>af <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
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

