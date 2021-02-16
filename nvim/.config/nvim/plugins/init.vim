call plug#begin(stdpath('data') . '/plugged')
    " Theme
    Plug 'joshdick/onedark.vim'

    " Language/Syntax Highlighting
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " code completion
    Plug 'luochen1990/rainbow'                      " rainbow brackets
    Plug 'sheerun/vim-polyglot'                     " syntax highlighting

    " Text Helpers
    Plug 'alvan/vim-closetag'       " auto close html tags
    Plug 'AndrewRadev/tagalong.vim' " change html tags
    Plug 'junegunn/vim-easy-align'  " align things
    Plug 'machakann/vim-sandwich'   " change surrounds e.g. brackets
    Plug 'mattn/emmet-vim'          " emmet
    Plug 'tpope/vim-commentary'     " comments

    " Motions
    Plug 'justinmk/vim-sneak'     " markers to move around
    Plug 'unblevable/quick-scope' " f/F, t/T motion helpers

    " Windows
    Plug 'simeji/winresizer' " window resizer/mover
    Plug 'szw/vim-maximizer' " window maximizer

    " Tools
    Plug 'antoinemadec/coc-fzf'                                                " fzf for coc
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                        " fzf
    Plug 'junegunn/fzf.vim'                                                    " fzf helpers
    Plug 'junegunn/vim-peekaboo'                                               " show contents of registers
    Plug 'iamcco/markdown-preview.nvim',
        \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown browser preview
    Plug 'liuchengxu/vim-which-key'                                            " keybindings guide popup
    Plug 'mbbill/undotree', { 'on': ['UndotreeShow', 'UndotreeToggle'] }       " undotree
    Plug 'sodapopcan/vim-twiggy', { 'on': 'Twiggy' }                           " git branches
    Plug 'skywind3000/asyncrun.vim'                                            " async tasks
    Plug 'tpope/vim-fugitive'                                                  " add :Git commands
    Plug 'vim-airline/vim-airline'                                             " status line
    Plug 'ryanoasis/vim-devicons'                                              " filetype icons

    " Misc
    Plug 'editorconfig/editorconfig-vim'                        " editorconfig
    Plug 'edkolev/tmuxline.vim', { 'on': 'Tmuxline' }           " match tmux with airline theme
    Plug 'moll/vim-bbye'                                        " better buffer delete/wipeout
    "Plug 'psliwka/vim-smoothie',
    "    \ { 'tag': '0c1696a9b3b8db8cdb567a5fe8b9d6d27e118c0b' } " smooth scrolling
    Plug 'romainl/vim-cool'                                     " automatically disables search highlighing
    Plug 'roxma/vim-tmux-clipboard'                             " vim-tmux clipboard sync
    Plug 'tmux-plugins/vim-tmux-focus-events'                   " tmux focus events
    "Plug 'tpope/vim-sensible'                                   " sensible config
    Plug 'vim-scripts/BufOnly.vim'                              " close all buffers except current
call plug#end()

source $HOME/.config/nvim/plugins/theme.vim
source $HOME/.config/nvim/plugins/config.vim
source $HOME/.config/nvim/plugins/coc.vim
