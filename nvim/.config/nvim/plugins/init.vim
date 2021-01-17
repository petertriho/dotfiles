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
    Plug 'tpope/vim-repeat'         " allow vim-surround to repeat with .

    " Motions
    Plug 'justinmk/vim-sneak'        " markers to move around
    Plug 'unblevable/quick-scope'    " f/F, t/T motion helpers

    " Windows
    Plug 'camspiers/lens.vim'        " auto window resizer
    Plug 'simeji/winresizer'         " window resizer/mover
    Plug 'wesQ3/vim-windowswap'      " swap windows

    " Tools
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                        " fzf
    Plug 'junegunn/fzf.vim'                                                    " fzf helpers
    Plug 'antoinemadec/coc-fzf'                                                " fzf for coc
    Plug 'junegunn/vim-peekaboo'                                               " show contents of registers
    Plug 'iamcco/markdown-preview.nvim',
        \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown browser preview
    Plug 'liuchengxu/vim-which-key'                                            " keybindings guide popup
    Plug 'mbbill/undotree'                                                     " undotree
    Plug 'stsewd/fzf-checkout.vim'                                             " git checkout
    Plug 'szw/vim-maximizer'                                                   " window maximizer
    Plug 'tpope/vim-fugitive'                                                  " add :Git commands
    Plug 'vim-airline/vim-airline'                                             " status bar

    " Misc
    Plug 'moll/vim-bbye'                      " better buffer delete/wipeout
    Plug 'psliwka/vim-smoothie'               " smooth scrolling
    Plug 'romainl/vim-cool'                   " automatically disables search highlighing
    Plug 'roxma/vim-tmux-clipboard'           " vim-tmux clipboard sync
    Plug 'tmux-plugins/vim-tmux-focus-events' " tmux focus events
    Plug 'tpope/vim-sensible'                 " sensible config
call plug#end()

source $HOME/.config/nvim/plugins/theme.vim
source $HOME/.config/nvim/plugins/config.vim
source $HOME/.config/nvim/plugins/coc.vim
