call plug#begin(stdpath('data') . '/plugged')
" Theme
Plug 'joshdick/onedark.vim'

" Language/Syntax Highlighting
Plug 'honza/vim-snippets'                              " snippets
Plug 'kkoomen/vim-doge',
            \ { 'do': {
            \ -> doge#install({ 'headless': 1 }) } }   " documentation generator
Plug 'lukas-reineke/indent-blankline.nvim',
            \ { 'branch': 'lua' }                      " indentation guides
Plug 'luochen1990/rainbow'                             " rainbow brackets
Plug 'neoclide/coc.nvim',
            \ { 'branch': 'master',
            \ 'do': 'yarn install --frozen-lockfile' } " lsp
Plug 'sheerun/vim-polyglot'                            " syntax highlighting

" Text Helpers
Plug 'alvan/vim-closetag'         " auto close html tags
Plug 'AndrewRadev/splitjoin.vim'  " split/join lines
Plug 'AndrewRadev/tagalong.vim'   " change html tags
Plug 'chaoren/vim-wordmotion'     " better word motions
Plug 'junegunn/vim-easy-align'    " align things
Plug 'machakann/vim-sandwich'     " change surrounds e.g. brackets
Plug 'mattn/emmet-vim'            " emmet
Plug 'rmagatti/alternate-toggler' " toggle alternate values
Plug 'tpope/vim-abolish'          " change case
Plug 'tpope/vim-commentary'       " comments
Plug 'tpope/vim-characterize'     " character representation
Plug 'tpope/vim-speeddating'      " date helpers
Plug 'wellle/targets.vim'         " text objects

" Motions
Plug 'justinmk/vim-sneak'     " markers to move around
Plug 'unblevable/quick-scope' " f/F, t/T motion helpers

" Windows
Plug 'junegunn/goyo.vim' " zen mode
Plug 'simeji/winresizer' " window resizer/mover
Plug 'szw/vim-maximizer' " window maximizer

" Tools
Plug 'antoinemadec/coc-fzf',
            \ { 'on': [
            \ 'CocFzfList',
            \ 'CocFzfListResume'
            \ ] }                               " fzf for coc
Plug 'junegunn/fzf',
            \ { 'do': { -> fzf#install() } }    " fzf
Plug 'junegunn/fzf.vim'                         " fzf helpers
Plug 'junegunn/vim-peekaboo'                    " show contents of registers
Plug 'iamcco/markdown-preview.nvim',
            \ { 'do': { -> mkdp#util#install() },
            \ 'for': ['markdown', 'vim-plug'] } " markdown browser preview
Plug 'liuchengxu/vim-which-key'                 " keybindings guide popup
Plug 'mbbill/undotree'                          " undotree
Plug 'skywind3000/asyncrun.vim',
            \ { 'on': 'AsyncRun' }              " async tasks
Plug 'stsewd/fzf-checkout.vim',
            \ { 'on': 'GBranches' }             " git branches
Plug 'rbong/vim-flog',
            \ { 'on': ['Flog', 'Flogsplit']}    " git log viewer
Plug 'tpope/vim-fugitive'                       " git
Plug 'vim-airline/vim-airline'                  " status line
Plug 'ryanoasis/vim-devicons'                   " filetype icons
Plug 'vimwiki/vimwiki'                          " personal wiki

" Misc
Plug 'antoinemadec/FixCursorHold.nvim'    " improve cursorhold performance
Plug 'editorconfig/editorconfig-vim'      " editorconfig
Plug 'edkolev/tmuxline.vim',
            \ { 'on': 'Tmuxline' }        " match tmux with airline theme
Plug 'moll/vim-bbye'                      " better buffer delete/wipeout
Plug 'roxma/vim-tmux-clipboard'           " vim-tmux clipboard sync
Plug 'ryvnf/readline.vim'                 " readline cmdline mappings
Plug 'schickling/vim-bufonly'             " close all buffers except current
Plug 'tmux-plugins/vim-tmux-focus-events' " tmux focus events
Plug 'tpope/vim-repeat'                   " repeat things
Plug 'tpope/vim-unimpaired'               " [] mappings
call plug#end()

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.jsx,*.tsx'

" AndrewRadev/splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

" antoinemadec/coc-fzf
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []

" antoinemadec/FixCursorHold.nvim
let g:cursorhold_updatetime = 100

" chaoren/vim-wordmotion
let g:wordmotion_prefix = '\'

" editorconfig/editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" edkolev/tmuxline.vim
let g:tmuxline_status_justify = 'left'
let g:tmuxline_preset = {}
let g:tmuxline_preset['a'] = '#S'
let g:tmuxline_preset['win'] = ['#I', '#W #F']
let g:tmuxline_preset['cwin'] = ['#I', '#W #F']
let g:tmuxline_preset['x'] = '#{prefix_highlight}'
let g:tmuxline_preset['y'] = ['%Y-%m-%d', '%I:%M %p']
let g:tmuxline_preset['z'] = '#h'

" junegunn/fzf.vim
" Rg searches file contents only
let g:rg_vars = 'rg '.
            \ '--column '.
            \ '--line-number '.
            \ '--no-heading '.
            \ '--color=always '.
            \ '--hidden '.
            \ '--glob "!{.git/*,}" '

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg '.
            \ '--column '.
            \ '--line-number '.
            \ '--no-heading '.
            \ '--color=always '.
            \ '--hidden '.
            \ '--glob "!{.git/*,}" '.
            \ '-- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': [
        \ '--phony',
        \ '--delimiter', ':',
        \ '--nth', '2..',
        \ '--query', a:query,
        \ '--bind', 'change:reload:'.reload_command
        \  ]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -bang -nargs=* Rg call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* RgVW
            \ call fzf#vim#grep(g:rg_vars.shellescape(<q-args>), 1,
            \ fzf#vim#with_preview({
            \ 'options': '--delimiter : --nth 2..',
            \ 'dir': $VIMWIKI_PATH
            \ }),
            \ <bang>0)

" junegunn/goyo.vim
let g:goyo_linenr = 1

" justinmk/vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
nmap ss <Plug>Sneak_s
nmap sS <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" kkoomen/vim-doge
let g:doge_mapping = '<leader>ad'

" lukas-reineke/indent-blankline.nvim
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_char = '│'
let g:indent_blankline_filetype_exclude = ['coc-explorer']

" luochen1990/rainbow
let g:rainbow_active = 1

" mbbill/undotree
if has('persistent_undo')
    if !isdirectory($HOME . '/.undodir')
        call mkdir($HOME . '/.undodir')
    endif

    set undodir=$HOME/.undodir
    set undofile
endif

" rmagatti/alternate-toggler
let g:at_custom_alternates = {
            \ 'true': 'false',
            \ 'True': 'False',
            \ '1': '0',
            \ 'yes': 'no',
            \ 'Yes': 'No',
            \ }

" sheerun/vim-polyglot
let g:polygot_disabled = ['autoindent', 'sensible']

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
augroup END

" szw/vim-maximizer
let g:maximizer_set_default_mapping = 0 " disable default bindings

" tpope/vim-fugitive
function! ToggleGstatus(vertical, ...)
    for l:winnr in range(1, winnr('$'))
		if !empty(getwinvar(l:winnr, 'fugitive_status'))
			execute l:winnr.'close'
		else
            if a:vertical == 0
                Gstatus
            else
                vertical Gstatus
            endif
		endif
	endfor
endfunction

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

let g:asyncrun_status = ''
let g:asyncrun_status_prev = ''
let g:asyncrun_status_icon = ''
function! GetAsyncrunStatus()
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

call airline#parts#define_function('asyncrun_status', 'GetAsyncrunStatus')
let g:airline_section_x = airline#section#create(['asyncrun_status', 'filetype'])

" vimwiki/vimwiki
let g:vimwiki_list = [{
            \ 'path': $VIMWIKI_PATH,
            \ 'syntax': 'markdown',
            \ 'ext': '.md'
            \ }]
let g:vimwiki_global_ext = 0
