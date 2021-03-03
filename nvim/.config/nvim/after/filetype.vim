if exists("did_load_custom_filetypes")
  finish
endif
let did_load_custom_filetypes = 1

augroup custom-filetype-detect
    autocmd!
    autocmd BufRead,BufNewFile *.dockerfile set filetype=dockerfile
    autocmd BufRead,BufNewFile .env.* set filetype=sh
augroup END
