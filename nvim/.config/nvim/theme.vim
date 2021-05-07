if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has('termguicolors'))
    set termguicolors
endif

function! SetColors()
    let s:white = { 'gui': g:terminal_color_7, 'cterm': '145', 'cterm16' : '7' }
    call onedark#set_highlight('Normal', { 'fg': s:white }) " `bg` will not be styled since there is no `bg` setting

    execute 'highlight QuickScopePrimary guifg=' . g:terminal_color_4 . ' gui=underline ctermfg=blue cterm=underline'
    execute 'highlight QuickScopeSecondary guifg=' . g:terminal_color_1 . ' gui=underline ctermfg=red cterm=underline'

    execute 'highlight Sneak guifg=#ffffff guibg=' . g:terminal_color_5 . ' ctermfg=white ctermbg=magenta'
    execute 'highlight SneakScope guibg=' . g:terminal_color_7 . ' ctermbg=white'

    execute 'highlight rainbowcol1 guifg=' . g:terminal_color_1
    execute 'highlight rainbowcol2 guifg=' . g:terminal_color_2
    execute 'highlight rainbowcol3 guifg=' . g:terminal_color_3
    execute 'highlight rainbowcol4 guifg=' . g:terminal_color_4
    execute 'highlight rainbowcol5 guifg=' . g:terminal_color_5
    execute 'highlight rainbowcol6 guifg=' . g:terminal_color_6
    execute 'highlight rainbowcol7 guifg=' . g:terminal_color_7

    function! AirlineThemePatch(palette)
        let a:palette.accents.running = [g:terminal_color_3, '', 'yellow' , '', '']
        let a:palette.accents.success = [g:terminal_color_10, '', 'green', '', '']
        let a:palette.accents.failure = [g:terminal_color_1, '', 'red'  , '', '']
    endfunction
    let g:airline_theme_patch_func = 'AirlineThemePatch'
endfunction

if (has('autocmd') && !has('gui_running'))
    augroup colorset
        autocmd!
        autocmd ColorScheme * call SetColors()
    augroup END
endif

" Theme
syntax on
set background=dark
let g:onedark_color_overrides = {
            \ 'cursor_grey': { 'gui': '#252525', 'cterm': '235', 'cterm16': '0' },
            \ 'vertsplit': { 'gui': '#2C323C', 'cterm': '236', 'cterm16': '8' }
            \ }
colorscheme onedark

set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
