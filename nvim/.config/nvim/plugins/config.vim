" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.jsx,*.tsx'

" antoinemadec/coc-fzf
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" editorconfig/editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" edkolev/tmuxline.vim
let g:tmuxline_status_justify = 'left'
let g:tmuxline_preset = {}
let g:tmuxline_preset['a'] = '#S'
let g:tmuxline_preset['win'] = ['#I', '#W #F']
let g:tmuxline_preset['cwin'] = ['#I:#P', '#W #F']
let g:tmuxline_preset['x'] = '#{prefix_highlight}'
let g:tmuxline_preset['y'] = ['%Y-%m-%d', '%I:%M %p']
let g:tmuxline_preset['z'] = '#h'

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
let g:twiggy_split_position = 'aboveleft'

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
            \ 'undotree',
            \ ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'custom'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.notexists = " ?"
let g:airline_symbols.dirty = " M"

function! AirlineThemePatch(palette)
    let a:palette.accents.running = ['#e5c07b', '', 'yellow' , '', '']
    let a:palette.accents.success = ['#98c379', '', 'green', '', '']
    let a:palette.accents.failure = ['#e06c75', '', 'red'  , '', '']
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'

let g:asyncrun_status = ''
let g:asyncrun_status_prev = ''
let g:asyncrun_status_icon = ''
function! Get_asyncrun_running()
    let asyncrun_status_curr = g:asyncrun_status

    if asyncrun_status_curr != g:asyncrun_status_prev
        if asyncrun_status_curr == 'running'
            call airline#parts#define_accent('asyncrun_status', 'running')
            let g:asyncrun_status_icon = ''
        elseif asyncrun_status_curr == 'success'
            call airline#parts#define_accent('asyncrun_status', 'success')
            let g:asyncrun_status_icon = ''
        elseif asyncrun_status_curr == 'failure'
            call airline#parts#define_accent('asyncrun_status', 'failure')
            let g:asyncrun_status_icon = ''
        endif

        let g:airline_section_x = airline#section#create(['asyncrun_status', 'filetype'])
        AirlineRefresh
        let g:asyncrun_status_prev = asyncrun_status_curr
    endif

    return g:asyncrun_status_icon . "  "
endfunction

call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
let g:airline_section_x = airline#section#create(['asyncrun_status', 'filetype'])
