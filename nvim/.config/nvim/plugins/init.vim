call plug#begin(stdpath('data') . '/plugged')
    " Theme
    Plug 'joshdick/onedark.vim'

    " Language/Syntax Highlighting
    Plug 'neoclide/coc.nvim', {'branch': 'release'}           " code completion
    Plug 'luochen1990/rainbow'                                " rainbow brackets
    Plug 'sheerun/vim-polyglot'                               " syntax highlighting

    " Text Helpers
    Plug 'AndrewRadev/tagalong.vim' " automatically change html tags
    Plug 'junegunn/vim-easy-align'  " align things
    Plug 'preservim/nerdcommenter'  " comments
    Plug 'tpope/vim-surround'       " change surrounds e.g. brackets

    " Motion
    Plug 'easymotion/vim-easymotion' " markers to move around
    Plug 'wesQ3/vim-windowswap'      " swap windows
    Plug 'simeji/winresizer'         " window resizer/mover

    " Tools
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                        " fzf
    Plug 'junegunn/fzf.vim'                                                    " fzf helpers
    Plug 'iamcco/markdown-preview.nvim', 
        \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown browser preview
    Plug 'liuchengxu/vim-which-key'                                            " keybindings guide popup
    Plug 'mbbill/undotree'                                                     " undotree
Plug 'mhinz/vim-signify'                                                       " version control diff column
    Plug 'szw/vim-maximizer'                                                   " window maximizer
    Plug 'tpope/vim-fugitive'                                                  " add :Git commands
    Plug 'vim-airline/vim-airline'                                             " status bar

    " Misc
    Plug 'moll/vim-bbye'        " better buffer delete/wipeout
    Plug 'psliwka/vim-smoothie' " smooth scrolling
call plug#end()

source $HOME/.config/nvim/plugins/theme.vim
source $HOME/.config/nvim/plugins/config.vim
source $HOME/.config/nvim/plugins/coc.vim
