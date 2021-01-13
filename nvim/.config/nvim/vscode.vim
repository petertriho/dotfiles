call plug#begin(stdpath('data') . '/vscode')
    Plug 'asvetliakov/vim-easymotion'
    Plug 'tpope/vim-surround'
call plug#end()

set clipboard+=unnamedplus " yank to clipboard

let g:EasyMotion_smartcase = 1 " turn on case-insensitive feature
nmap ' <Plug>(easymotion-prefix)
nmap 'l <Plug>(easymotion-bd-jk)

function! s:organizeFormat()
    call VSCodeNotify('editor.action.organizeImports')
    call VSCodeNotify('editor.action.format')
endfunction

function! s:vscodeCommentary(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [line1, line2] = [a:1, a:2]
    else
        let [line1, line2] = [line("'["), line("']")]
    endif

    call VSCodeCallRange('editor.action.commentLine', line1, line2, 0)
endfunction

nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>

" map space to leader
let mapleader = " "
nnoremap <space> <nop>

nnoremap <expr> <leader>/ <SID>vscodeCommentary()
xnoremap <expr> <leader>/ <SID>vscodeCommentary() . '_'

nnoremap <C-Space> <Cmd>call VSCodeNotify('editor.action.triggerSuggest')<cr>

nnoremap <leader>- <Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>
nnoremap <leader>\ <Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>
nnoremap <leader>d <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <leader>f <Cmd>call <SID>organizeFormat()<CR>
nnoremap <leader>i <Cmd>call VSCodeNotify('workbench.actions.view.problems')<CR>
nnoremap <leader>o <Cmd>call VSCodeNotify('workbench.action.files.openFile')<CR>
nnoremap <leader>s <Cmd>call VSCodeNotify('workbench.view.search')<CR>
nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeEditorsInGroup')<CR>
nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>

nnoremap <leader>al <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>

" Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

