" easymotion/vim-easymotion
let g:EasyMotion_smartcase = 1 " turn on case-insensitive feature
nmap ' <Plug>(easymotion-prefix)
nmap 'l <Plug>(easymotion-bd-jk)

" luochen1990/rainbow
let g:rainbow_active = 1 

" preservim/nerdcommenter
let g:NERDCreateDefaultMappings = 0

" simeji/winresizer
let g:winresizer_start_key = "<M-e>"

" szw/vim-maximizer
let g:maximizer_set_default_mapping = 0 " disable default bindings

" mbbill/undotree
if has("persistent_undo")
    set undodir=$HOME/.undodir
    set undofile
endif

" vim-airline/vim-airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#coc_git = 1

" wesQ3/vim-windowsnap
let g:windowswap_map_keys = 0 " disable default bindings

