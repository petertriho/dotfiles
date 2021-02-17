if exists("b:loaded_wobble_jsx") || !exists("g:loaded_wobble")
  finish
endif
let b:loaded_wobble_jsx = 1



call wobble#MapTextObject('hf"F=Bgelv2f"'                    , 'aA')
call wobble#MapTextObject('hf"F=Bv2f"'                       , 'iA')
call wobble#MapTextObject('hf"F=gevBo'                       , 'iN')
call wobble#MapTextObject('hf"F=f"lvi"'                      , 'iV')

call wobble#MapTextObject('vato\evi<of o'                    , 'aL' , '+e')
call wobble#MapTextObject('vato\evi<oWo'                     , 'iL' , '+e')

call wobble#MapTextObject('vato\e/className\r:noh\rF v2f\"'  , 'aC' , '+e')
call wobble#MapTextObject('vato\e/className\r:noh\rf\"lvi\"' , 'iC' , '+e')

call wobble#MapTextObject('vato\e/id\r:noh\rF v2f\"'         , 'aI' , '+e')
call wobble#MapTextObject('vato\e/id\r:noh\rf\"lvi\"'        , 'iI' , '+e')

call wobble#MapTextObject('vi<geowo'                         , 'ic')



call wobble#MapLocalLeader('vato<esc>f>i<space>'                             , 'aL')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i className=""<esc>i' , 'iC')
call wobble#MapLocalLeader('vato<esc>/class<cr>:noh<cr>2f"i<space>'          , 'aC')
call wobble#MapLocalLeader('vato<esc>/[ \>]<cr>:noh<cr>i id=""<esc>i'        , 'iI')
