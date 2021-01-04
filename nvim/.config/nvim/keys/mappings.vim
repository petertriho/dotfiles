" Mappings
" Leader
let mapleader = "\<Space>"
nnoremap <Space> <Nop>

" Buffers
nnoremap <silent> <Tab> :bnext<cr>
nnoremap <silent> <S-Tab> :bprevious<cr>
nnoremap <silent> <M-d> :Bdelete<cr>

" Windows - Navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-\> <C-w>p


" Windows - Resize
nnoremap <silent> <M-k> :resize -2<cr>
nnoremap <silent> <M-j> :resize +2<cr>
nnoremap <silent> <M-h> :vertical resize -2<cr>
nnoremap <silent> <M-l> :vertical resize +2<cr>
map <M-=> <C-w>= 

" Windows - Layout
nnoremap <silent> <M-m> :MaximizerToggle!<cr>

nnoremap <silent> <M-y> :call WindowSwap#MarkWindowSwap()<cr>
nnoremap <silent> <M-p> :call WindowSwap#DoWindowSwap()<cr>
nnoremap <silent> <M-w> :call WindowSwap#EasyWindowSwap()<cr>

nnoremap <silent> <M-q> :q<cr>

" Move lines
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
