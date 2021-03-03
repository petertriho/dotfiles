if exists("did_load_custom_filetypes")
  finish
endif
let did_load_custom_filetypes = 1

augroup customfiletypedetect
    au! BufRead,BufNewFile *.dockerfile set filetype=dockerfile
    au! BufRead,BufNewFile .env.* set filetype=sh
augroup END
