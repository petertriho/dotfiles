nnoremap <buffer> <silent> <M-t> <C-W><CR><C-W>T
nnoremap <buffer> <silent> <M-s> <CMD>lua require('qf_helper').open_split('split')<CR>
nnoremap <buffer> <silent> <M-v> <CMD>lua require('qf_helper').open_split('vsplit')<CR>

nnoremap <buffer> <silent> <M-o> <CR><C-W>p

nnoremap <buffer> <silent> <M-n> j<CR><C-W>p
nnoremap <buffer> <silent> <M-p> k<CR><C-W>p

nnoremap <buffer> <silent> { <CMD>lua require('qf_helper').navigate(-1, {by_file = true})<CR><C-W>p
nnoremap <buffer> <silent> } <CMD>lua require('qf_helper').navigate(1, {by_file = true})<CR><C-W>p

noremap <buffer> <silent> K :Keep<CR>
noremap <buffer> <silent> R :Reject<CR>

noremap <buffer> <silent> <M-r> <CMD>lua require('replacer').run()<CR>
