set hlsearch                      " highlight all search results
set incsearch                     " show incremental search incrementally
set ignorecase                    " case insensitive
set smartcase                     " case sensitive if upper

set number                        " display line number
set relativenumber                " relative line number

set autoread                      " autoread if file changes elsewhere
set backspace=indent,eol,start    " better backspace
set hidden                        " allow changing buffers without saving
set noswapfile                    " disable swap file

set tabstop=4                     " space characters inserted when tab is pressed
set softtabstop=4                 " backspace removes X spaces
set shiftwidth=4                  " spaces inserted for indentation
set expandtab                     " insert space instead of tab characters
set smarttab                      " shiftwidth instead of tabstop at start of lines
set autoindent                    " apply indent to next line according to current
set smartindent                   " indent according to syntax/style

set clipboard+=unnamedplus        " yank to clipboard
set mouse=a                       " enable mouse
set nowrap                        " disable line wrapping

set noerrorbells                  " disable error bells
set novisualbell                  " disable visual bells

set title                         " set terminal's title
set titlestring=vim\ %t\ %M\ (%F) " terminal title format

set splitright                    " default vertical split right
set splitbelow                    " default horizontal split below

filetype plugin indent on         " turn on filetype detection, plugin, indent on
syntax on                         " syntax highlighting

set timeoutlen=500                " speed up mapping
set ttimeout                      " speed up key code
set ttimeoutlen=10                " speed up key code
set lazyredraw                    " speed up macros

colorscheme peachpuff
