" Mappings
" Leader
let mapleader = "\<Space>"
nnoremap <Space> <Nop>

" Buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <M-d> :Bdelete<CR>

" Tabs
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>

" Windows - Navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-\> <C-w>p

" Windows - Resize
nnoremap <silent> <M-k> :resize -2<CR>
nnoremap <silent> <M-j> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>
nnoremap <silent> <M-f> :MaximizerToggle!<CR>
map <M-=> <C-w>=

" Move lines
nnoremap <silent> <M-d> :m .+1<CR>==
nnoremap <silent> <M-u> :m .-2<CR>==
vnoremap <silent> <M-d> :m '>+1<CR>gv=gv
vnoremap <silent> <M-u> :m '<-2<CR>gv=gv

