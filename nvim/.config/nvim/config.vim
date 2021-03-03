set hlsearch                       " highlight all search results
set ignorecase                     " case insensitive search
set incsearch                      " show incremental search results as you type
set smartcase                      " case sensitive search (> 0 uppercase charater)

set number                         " display line number
set relativenumber                 " relative line number

set autoread                       " autoread if file changes elsewhere
set backspace=indent,eol,start     " better backspace
set hidden                         " allow changing buffers without saving
set noswapfile                     " disable swap file

set tabstop=4                      " space characters inserted when tab is pressed
set softtabstop=4                  " backspace removes X spaces
set shiftwidth=4                   " spaces inserted for indentation
set expandtab                      " insert space instead of tab characters
set smarttab                       " shiftwidth instead of tabstop at start of lines
set autoindent                     " apply indent to next line according to current
set smartindent                    " indent according to syntax/style

set clipboard+=unnamedplus         " yank to clipboard
set mouse=a                        " enable mouse
set nowrap                         " disable line wrapping

set noerrorbells                   " disable error bells
set novisualbell                   " disable visual bells

set title                          " set terminal's title
set titlestring=nvim\ %t\ %M\ (%F) " terminal title format

set splitright                     " default vertical split right
set splitbelow                     " default horizonal split below

set colorcolumn=80                 " max column line
set cursorline                     " highlight current line

set noshowmode                     " disable mode indicator
set timeoutlen=500                 " speed up mapping
set ttimeout                       " speed up key code
set ttimeoutlen=10                 " speed up key code
set lazyredraw                     " speed up macros

if exists($VIRTUAL_ENV)
    let g:python3_host_prog=substitute(system('which -a python3 | head -n2 | tail -n1'), '\n', '', 'g')
else
    let g:python3_host_prog=substitute(system('which python3'), '\n', '', 'g')
endif
