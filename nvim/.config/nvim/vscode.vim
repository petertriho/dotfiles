set clipboard+=unnamedplus " yank to clipboard
set lazyredraw             " speed up macros

call plug#begin(stdpath('data') . '/vscode')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'asvetliakov/vim-easymotion'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'unblevable/quick-scope'
call plug#end()

function! s:vscodeBetterAlign(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [line1, line2] = [a:1, a:2]
    else
        let [line1, line2] = [line("'["), line("']")]
    endif

    call VSCodeCallRange('wwm.aligncode', line1, line2, 0)
endfunction

" AndrewRadev/splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

" asvetliakov/vim-easymotion
let g:EasyMotion_smartcase = 1 " turn on case-insensitive feature
nmap s <Plug>(easymotion-prefix)
nmap sl <Plug>(easymotion-bd-jk)

" machakann/vim-highlightedyank
highlight HighlightedyankRegion guibg='#98c379' gui=underline ctermbg='green' cterm=underline
let g:highlightedyank_highlight_duration = 200

" machakann/vim-sandwich
highlight OperatorSandwichBuns guifg='#c678dd' gui=underline ctermfg='blue' cterm=underline
highlight OperatorSandwichChange guifg='#e5c07b' gui=underline ctermfg='yellow' cterm=underline
highlight OperatorSandwichAdd guibg='#98c379' gui=underline ctermbg='green' cterm=underline
highlight OperatorSandwichDelete guibg='#e06c75' gui=underline ctermbg='red' cterm=underline

" unblevable/quick-scope
highlight QuickScopePrimary guifg='#61afef' gui=underline ctermfg='blue' cterm=underline
highlight QuickScopeSecondary guifg='#e06c75' gui=underline ctermfg='red' cterm=underline

map <TAB> :Tabnext<CR>
map <S-TAB> :Tabprev<CR>

map gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

let mapleader = ' '
noremap <Space> <NOP>

omap <Leader>/ <Plug>VSCodeCommentary
xmap <Leader>/ <Plug>VSCodeCommentary
nmap <Leader>/ <Plug>VSCodeCommentaryLine

noremap <Leader><Space> <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
noremap <Leader>- <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
noremap <Leader>. :Only!<CR>
noremap <Leader>; <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
noremap <Leader>\ <Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>
noremap <Leader>d <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
noremap <Leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
noremap <Leader>f <Cmd>call VSCodeNotify('editor.action.format')<CR>
map <Leader>h :nohlsearch<CR>
noremap <Leader>i <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>
noremap <Leader>o <Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>
noremap <Leader>q <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
noremap <Leader>Q <Cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>
noremap <Leader>s <Cmd>call VSCodeNotify('workbench.view.search')<CR>

xnoremap <expr> <Leader>aa <SID>vscodeBetterAlign()
nmap <Leader>aj :SplitjoinJoin<CR>
nnoremap <expr> <Leader>af <SID>vscodeFormat() . '_'
xnoremap <expr> <Leader>af <SID>vscodeFormat()
noremap <Leader>al <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
map <Leader>as :sort i<CR>
map <Leader>ap ggVG"+p
noremap <Leader>aq <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nmap <Leader>ax :SplitjoinSplit<CR>
map <Leader>ay :%y+<CR>

" Navigation
noremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
noremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
noremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
noremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
