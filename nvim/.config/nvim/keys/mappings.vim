" Mappings
" Leader
let mapleader = "\<space>"
nnoremap <space> <nop>

" Buffers
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>
nnoremap <silent> <m-d> :Bdelete<cr>

" Windows - Navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-\> <c-w>p


" Windows - Resize
nnoremap <silent> <m-k> :resize -2<cr>
nnoremap <silent> <m-j> :resize +2<cr>
nnoremap <silent> <m-h> :vertical resize -2<cr>
nnoremap <silent> <m-l> :vertical resize +2<cr>
map <m-=> <c-w>= 

" Windows - Layout
nnoremap <silent> <m-m> :MaximizerToggle!<cr>

nnoremap <silent> <m-y> :call WindowSwap#MarkWindowSwap()<cr>
nnoremap <silent> <m-p> :call WindowSwap#DoWindowSwap()<cr>
nnoremap <silent> <m-w> :call WindowSwap#EasyWindowSwap()<cr>

nnoremap <silent> <m-q> :q<cr>

" Move lines
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
