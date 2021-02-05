" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.jsx,*.tsx'

" antoinemadec/coc-fzf
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" editorconfig/editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" justinmk/vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
map ss <Plug>Sneak_s
map sS <Plug>Sneak_S

" luochen1990/rainbow
let g:rainbow_active = 1

" mbbill/undotree
if has('persistent_undo')
    set undodir=$HOME/.undodir
    set undofile
endif

" preservim/nerdcommenter
let g:NERDCreateDefaultMappings = 0

" simeji/winresizer
let g:winresizer_start_key = '<M-e>'

" skywind3000/asyncrun.vim
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

augroup asyncrun
    autocmd!
    " automate opening quickfix window when AsyncRun starts (won't be triggered by other quickfix commands)
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup end

" sodapopcan/vim-twiggy
set shell=bash

" szw/vim-maximizer
let g:maximizer_set_default_mapping = 0 " disable default bindings

" unblevable/quick-scope
" cannot use ; and , with f/t https://github.com/unblevable/quick-scope/issues/55
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-airline/vim-airline
let g:airline_theme = 'onedark'
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1
let g:airline_extensions = [
            \ 'branch',
            \ 'coc',
            \ 'fugitiveline',
            \ 'tabline',
            \ ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
