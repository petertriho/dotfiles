if exists("did_load_custom_filetypes")
    finish
endif
let did_load_custom_filetypes = 1

augroup custom_filetype_detect
    autocmd!
    autocmd BufRead,BufNewFile *.dockerfile set filetype=dockerfile
    autocmd BufRead,BufNewFile .env,*.env.* set filetype=conf
    autocmd BufRead,BufNewFile *.prisma set filetype=prisma
augroup END
