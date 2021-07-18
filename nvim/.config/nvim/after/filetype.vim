if exists("did_load_filetypes_userafter")
    finish
endif
let did_load_filetypes_userafter = 1

augroup filetype_detect
    autocmd!
    autocmd BufNewFile,BufRead *.dockerfile setlocal filetype=dockerfile
    autocmd BufNewFile,BufRead .env,*.env.* setlocal filetype=conf
augroup END
