if exists("b:loaded_wobble_jsx") || !exists("g:loaded_wobble")
  finish
endif

let b:loaded_wobble_jsx = 1

call wobble#MapTextObject('h/\\v[{}\"'."'".']+\rF=Bgelv/\\v[{\"'."'".']+\r/\\v[}\"'."'".']+\r\e:nohl\rgv', 'aA', '+e')
call wobble#MapTextObject('h/\\v[{}\"'."'".']+\rF=Bv/\\v[{\"'."'".']+\r/\\v[}\"'."'".']+\r\e:nohl\rgv', 'iA', '+e')
call wobble#MapTextObject('h/\\v[{}\"'."'".']+\rF=gevBo:nohl\rgv', 'iN', '+e')
call wobble#MapTextObject('h/\\v[{}\"'."'".']+\rF=/\\v[{\"'."'".']+\rv/\\v[}\"'."'".']+\roloh\e:nohl\rgv', 'iV', '+e')
call wobble#MapTextObject('h/\\v[{}\"'."'".']+\rF=/\\v[{\"'."'".']+\rv/\\v[}\"'."'".']+\r\e:nohl\rgv', 'aV', '+e')

call wobble#MapTextObject('vato\evi<of o', 'aL', '+e')
call wobble#MapTextObject('vato\evi<oWo', 'iL', '+e')

call wobble#MapTextObject('vato\e/className\r/\\v[{}\"'."'".']+\rF=/\\v[{\"'."'".']+\rv/\\v[}\"'."'".']+\roloh\e:nohl\rgv', 'iC', '+e')
call wobble#MapTextObject('vato\e/className\r/\\v[{}\"'."'".']+\rF=Bgelv/\\v[{\"'."'".']+\r/\\v[}\"'."'".']+\r\e:nohl\rgv', 'aC', '+e')

call wobble#MapTextObject('vato\e/id\r/\\v[{}\"'."'".']+\rF=/\\v[{\"'."'".']+\rv/\\v[}\"'."'".']+\roloh\e:nohl\rgv', 'iI', '+e')
call wobble#MapTextObject('vato\e/id\r/\\v[{}\"'."'".']+\rF=Bgelv/\\v[{\"'."'".']+\r/\\v[}\"'."'".']+\r\e:nohl\rgv', 'aI', '+e')

call wobble#MapTextObject('vi{geowo', 'ic')

" call wobble#MapLocalLeader('vato<esc>f>i<space>'                             , 'aL')
" call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i className=""<esc>i' , 'iC')
" call wobble#MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>'          , 'aC')
" call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i'        , 'iI')
