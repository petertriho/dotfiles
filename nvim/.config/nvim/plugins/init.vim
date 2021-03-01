call plug#begin(stdpath('data') . '/plugged')
" Theme
Plug 'joshdick/onedark.vim'

" Language/Syntax Highlighting
Plug 'honza/vim-snippets'                             " snippets
Plug 'kkoomen/vim-doge',
            \ { 'do': { -> doge#install() } }         " documentation generator
Plug 'lukas-reineke/indent-blankline.nvim',
            \ { 'branch': 'lua'}                      " indent lines
Plug 'luochen1990/rainbow'                            " rainbow brackets
Plug 'neoclide/coc.nvim',
            \ {'branch': 'master',
            \ 'do': 'yarn install --frozen-lockfile'} " lsp
Plug 'sheerun/vim-polyglot'                           " syntax highlighting

" Text Helpers
Plug 'alvan/vim-closetag'        " auto close html tags
Plug 'AndrewRadev/splitjoin.vim' " split/join lines
Plug 'AndrewRadev/tagalong.vim'  " change html tags
Plug 'junegunn/vim-easy-align'   " align things
Plug 'machakann/vim-sandwich'    " change surrounds e.g. brackets
Plug 'mattn/emmet-vim'           " emmet
Plug 'mg979/vim-visual-multi'    " multi cursors
Plug 'tpope/vim-commentary'      " comments

" Motions
Plug 'justinmk/vim-sneak'     " markers to move around
Plug  'tpope/vim-repeat'      " repeat vim-sneak
Plug 'unblevable/quick-scope' " f/F, t/T motion helpers

" Windows
Plug 'junegunn/goyo.vim' " zen mode
Plug 'simeji/winresizer' " window resizer/mover
Plug 'szw/vim-maximizer' " window maximizer

" Tools
Plug 'antoinemadec/coc-fzf',
            \ { 'on': ['CocFzfList', 'CocFzfListResume'] } " fzf for coc
Plug 'junegunn/fzf',
 \ { 'do': { -> fzf#install() } }                          " fzf
Plug 'junegunn/fzf.vim'                                    " fzf helpers
Plug 'junegunn/vim-peekaboo'                               " show contents of registers
Plug 'iamcco/markdown-preview.nvim',
            \ { 'do': { -> mkdp#util#install() },
            \ 'for': ['markdown', 'vim-plug'] }            " markdown browser preview
Plug 'liuchengxu/vim-which-key'                            " keybindings guide popup
Plug 'mbbill/undotree'                                     " undotree
Plug 'skywind3000/asyncrun.vim', { 'on': 'AsyncRun' }      " async tasks
Plug 'sodapopcan/vim-twiggy', { 'on': 'Twiggy' }           " git branches
Plug 'tpope/vim-fugitive'                                  " git
Plug 'vim-airline/vim-airline'                             " status line
Plug 'vimwiki/vimwiki'                                     " personal wiki
Plug 'ryanoasis/vim-devicons'                              " filetype icons

" Misc
Plug 'editorconfig/editorconfig-vim'              " editorconfig
Plug 'edkolev/tmuxline.vim', { 'on': 'Tmuxline' } " match tmux with airline theme
Plug 'moll/vim-bbye'                              " better buffer delete/wipeout
Plug 'romainl/vim-cool'                           " automatically disables search highlighing
Plug 'roxma/vim-tmux-clipboard'                   " vim-tmux clipboard sync
Plug 'schickling/vim-bufonly'                     " close all buffers except current
Plug 'tmux-plugins/vim-tmux-focus-events'         " tmux focus events
call plug#end()

source $HOME/.config/nvim/plugins/theme.vim
source $HOME/.config/nvim/plugins/config.vim
source $HOME/.config/nvim/plugins/coc.vim

