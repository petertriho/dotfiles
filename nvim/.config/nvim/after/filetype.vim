if exists("did_load_custom_filetypes")
    finish
endif
let did_load_custom_filetypes = 1

augroup custom_filetype_detect
    autocmd!
    autocmd BufRead,BufNewFile *.dockerfile setlocal filetype=dockerfile
    autocmd BufRead,BufNewFile .env,*.env.* setlocal filetype=conf
    autocmd BufRead,BufNewFile *.prisma setlocal filetype=prisma
augroup END
