if exists("did_load_after_filetypes")
    finish
endif
let did_load_after_filetypes = 1

augroup filetype_detect
    autocmd!
    autocmd BufNewFile,BufRead *.dockerfile setlocal filetype=dockerfile
    autocmd BufNewFile,BufRead *.prettierrc setlocal filetype=jsonc
    autocmd BufNewFile,BufRead *.prisma setlocal filetype=prisma
    autocmd BufNewFile,BufRead .env,*.env.* setlocal filetype=conf
augroup END
