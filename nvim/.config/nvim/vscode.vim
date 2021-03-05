set clipboard+=unnamedplus " yank to clipboard
set lazyredraw             " speed up macros

call plug#begin(stdpath('data') . '/vscode')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'asvetliakov/vim-easymotion'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
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

nmap <TAB> :Tabnext<CR>
nmap <S-TAB> :Tabprev<CR>

nmap gc <Plug>VSCodeCommentary
omap gc <Plug>VSCodeCommentary
xmap gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

let mapleader = ' '
noremap <Space> <NOP>

omap <Leader>/ <Plug>VSCodeCommentary
xmap <Leader>/ <Plug>VSCodeCommentary
nmap <Leader>/ <Plug>VSCodeCommentaryLine

nnoremap <Leader><Space> <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <Leader>- <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap <Leader>. :Only!<CR>
nnoremap <Leader>; <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <Leader>\ <Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>
nnoremap <Leader>d <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <Leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <Leader>f <Cmd>call VSCodeNotify('editor.action.format')<CR>
nnoremap <Leader>i <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>
nnoremap <Leader>o <Cmd>call VSCodeNotify('editor.action.organizeImports')<CR>
nnoremap <Leader>q <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nnoremap <Leader>Q <Cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>
nnoremap <Leader>s <Cmd>call VSCodeNotify('workbench.view.search')<CR>

xnoremap <expr> <Leader>aa <SID>vscodeBetterAlign()
nmap <Leader>aj :SplitjoinJoin<CR>
xnoremap <expr> <Leader>af <SID>vscodeFormat()
nnoremap <expr> <Leader>af <SID>vscodeFormat() . '_'
nnoremap <Leader>al <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
nmap <Leader>as :sort i<CR>
xmap <Leader>as :sort i<CR>
nmap <Leader>ap ggVG"+p
nnoremap <Leader>aq <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
nmap <Leader>ax :SplitjoinSplit<CR>
nmap <Leader>ay :%y+<CR>

" Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
