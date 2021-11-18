nnoremap <buffer> <silent> <C-t> <C-W><CR><C-W>T
nnoremap <buffer> <silent> <C-s> <CMD>lua require('qf_helper').open_split('split')<CR>
nnoremap <buffer> <silent> <C-v> <CMD>lua require('qf_helper').open_split('vsplit')<CR>

nnoremap <buffer> <silent> <C-o> <CR><C-W>p

nnoremap <buffer> <silent> <C-p> k<CR><C-W>p
nnoremap <buffer> <silent> <C-n> j<CR><C-W>p

nnoremap <buffer> <silent> { <CMD>lua require('qf_helper').navigate(-1, {by_file = true})<CR><C-W>p
nnoremap <buffer> <silent> } <CMD>lua require('qf_helper').navigate(1, {by_file = true})<CR><C-W>p

noremap <buffer> <silent> K <CMD>Keep<CR>
noremap <buffer> <silent> R <CMD>Reject<CR>

noremap <buffer> <silent> r <CMD>lua require('replacer').run()<CR>
