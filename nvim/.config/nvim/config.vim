set hlsearch                   " highlight all search results
set ignorecase                 " do case insensitive search
set incsearch                  " show incremental search results as you type

set number                     " display line number
set relativenumber             " relative line number

set autoread                   " autoread if file changes elsewhere
set backspace=indent,eol,start " better backspace
set hidden                     " allow changing buffers without saving
set noswapfile                 " disable swap file

set tabstop=4                  " space characters inserted when tab is pressed
set softtabstop=4              " backspace removes X spaces
set shiftwidth=4               " spaces inserted for indentation
set expandtab                  " insert space instead of tab characters
set smarttab                   " shiftwidth instead of tabstop at start of lines
set autoindent                 " apply indent to next line according to current
set smartindent                " indent according to syntax/style

set clipboard+=unnamedplus     " yank to clipboard
set mouse=a                    " enable mouse
set nowrap                     " disable line wrapping

set colorcolumn=80             " max column line

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup config
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end

