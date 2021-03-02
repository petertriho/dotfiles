if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

if (has('autocmd') && !has('gui_running'))
    augroup colorset
        autocmd!
        let s:white = { 'gui': '#ABB2BF', 'cterm': '145', 'cterm16' : '7' }
        autocmd ColorScheme * call onedark#set_highlight('Normal', { 'fg': s:white }) " `bg` will not be styled since there is no `bg` setting
        autocmd ColorScheme * highlight QuickScopePrimary guifg='#61afef' gui=underline ctermfg='blue' cterm=underline
        autocmd ColorScheme * highlight QuickScopeSecondary guifg='#e06c75' gui=underline ctermfg='red' cterm=underline
    augroup end
endif

" Theme
syntax on
set background=dark
let g:onedark_color_overrides = {
            \ 'cursor_grey': { 'gui': '#212121', 'cterm': '235', 'cterm16': '0' },
            \ 'vertsplit': { "gui": "#2C323C", "cterm": "236", "cterm16": "8" }
            \ }
colorscheme onedark

set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
