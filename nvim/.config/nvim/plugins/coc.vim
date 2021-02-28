" Coc
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-cssmodules',
            \ 'coc-diagnostic',
            \ 'coc-docker',
            \ 'coc-emmet',
            \ 'coc-emoji',
            \ 'coc-eslint',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-markdownlint',
            \ 'coc-marketplace',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-sh',
            \ 'coc-snippets',
            \ 'coc-tabnine',
            \ 'coc-tailwindcss',
            \ 'coc-tsserver',
            \ 'coc-yaml',
            \ 'coc-yank',
            \ 'https://github.com/rodrigore/coc-tailwind-intellisense'
            \ ]

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab and ctrl + j/k for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? '\<C-n>' :
            \ <SID>check_back_space() ? '\<TAB>' :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? '\<C-p>' : '\<C-h>'

inoremap <silent><expr> <C-j>
            \ pumvisible() ? '\<C-n>' :
            \ <SID>check_back_space() ? '\<TAB>' :
            \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? '\<C-p>' : '\<C-h>'

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <C-space> coc#refresh()
else
    inoremap <silent><expr> <C-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
            \: '\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>'

nmap <silent> [i <Plug>(coc-diagnostic-prev)
nmap <silent> ]i <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> gh :call <SID>show_hover()<CR>

function! s:show_hover()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : '\<C-f>'
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : '\<C-b>'
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : '\<Right>'
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : '\<Left>'
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : '\<C-f>'
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : '\<C-b>'
endif

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Make coc-explorer default
function! s:DisableFileExplorer()
    au! FileExplorer
endfunction

function! s:OpenDirHere(dir)
    if isdirectory(a:dir)
        exec 'silent CocCommand explorer --toggle --sources=file+ ' . a:dir
    endif
endfunction

augroup CocExplorerDefault
    autocmd!
    autocmd VimEnter * call <SID>DisableFileExplorer()
    autocmd VimEnter * call <SID>OpenDirHere(expand('<amatch>'))
augroup end

" coc-git
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
augroup cocgit
    autocmd!
    autocmd CursorHold * CocCommand git.refresh
augroup end

" coc-snippets
vmap <M-n> <Plug>(coc-snippets-select)
imap <M-n> <Plug>(coc-snippets-expand-jump)
let g:coc_snippet_next = '<M-n>'
let g:coc_snippet_prev = '<M-p>'

