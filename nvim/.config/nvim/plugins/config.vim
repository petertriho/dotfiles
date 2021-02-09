" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.jsx,*.tsx'

" antoinemadec/coc-fzf
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" camspiers/lens.vim
let g:lens#animate = 0
let g:lens#disabled_filetypes = ['fzf', 'coc-explorer']

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
    " only show quickfix when error
    autocmd User AsyncRunStop
                  \ if g:asyncrun_status=='failure' |
                  \   execute('call asyncrun#quickfix_toggle(8, 1)') |
                  \ else |
                  \   execute('call asyncrun#quickfix_toggle(8, 0)') |
                  \ endif
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

function! AirlineThemePatch(palette)
    let a:palette.accents.running = [ '', '', '', '', '' ]
    let a:palette.accents.success = [ '#98c379', '' , 'green', '', '' ]
    let a:palette.accents.failure = [ '#e06c75', '' , 'red', '', '' ]
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'

let g:async_status_old = ''
function! Get_asyncrun_running()
    let async_status = g:asyncrun_status
    if async_status != g:async_status_old
        if async_status == 'running'
            call airline#parts#define_accent('asyncrun_status', 'running')
        elseif async_status == 'success'
            call airline#parts#define_accent('asyncrun_status', 'success')
        elseif async_status == 'failure'
            call airline#parts#define_accent('asyncrun_status', 'failure')
        endif

        let g:airline_section_x = airline#section#create(['asyncrun_status'])
        AirlineRefresh
        let g:async_status_old = async_status
    endif

    return async_status
endfunction

call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
let g:airline_section_x = airline#section#create(['asyncrun_status'])
