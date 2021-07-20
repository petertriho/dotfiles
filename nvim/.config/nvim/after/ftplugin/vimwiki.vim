call vimwiki#u#map_key('n', 'gnt', '<Plug>VimwikiNextTask')
call vimwiki#u#map_key('n', '<C-Space>', '<Plug>VimwikiToggleListItem')
call vimwiki#u#map_key('v', '<C-Space>', '<Plug>VimwikiToggleListItem', 1)
if has('unix')
    call vimwiki#u#map_key('n', '<C-@>', '<Plug>VimwikiToggleListItem', 1)
    call vimwiki#u#map_key('v', '<C-@>', '<Plug>VimwikiToggleListItem', 1)
endif
call vimwiki#u#map_key('n', 'glx', '<Plug>VimwikiToggleRejectedListItem')
call vimwiki#u#map_key('v', 'glx', '<Plug>VimwikiToggleRejectedListItem', 1)
call vimwiki#u#map_key('n', 'gln', '<Plug>VimwikiIncrementListItem')
call vimwiki#u#map_key('v', 'gln', '<Plug>VimwikiIncrementListItem', 1)
call vimwiki#u#map_key('n', 'glp', '<Plug>VimwikiDecrementListItem')
call vimwiki#u#map_key('v', 'glp', '<Plug>VimwikiDecrementListItem', 1)
call vimwiki#u#map_key('i', '<C-D>', '<Plug>VimwikiDecreaseLvlSingleItem')
call vimwiki#u#map_key('i', '<C-T>', '<Plug>VimwikiIncreaseLvlSingleItem')
call vimwiki#u#map_key('n', 'glh', '<Plug>VimwikiDecreaseLvlSingleItem', 1)
call vimwiki#u#map_key('n', 'gll', '<Plug>VimwikiIncreaseLvlSingleItem', 1)
call vimwiki#u#map_key('n', 'gLh', '<Plug>VimwikiDecreaseLvlWholeItem')
call vimwiki#u#map_key('n', 'gLH', '<Plug>VimwikiDecreaseLvlWholeItem', 1)
call vimwiki#u#map_key('n', 'gLl', '<Plug>VimwikiIncreaseLvlWholeItem')
call vimwiki#u#map_key('n', 'gLL', '<Plug>VimwikiIncreaseLvlWholeItem', 1)
call vimwiki#u#map_key('i', '<C-L><C-J>', '<Plug>VimwikiListNextSymbol')
call vimwiki#u#map_key('i', '<C-L><C-K>', '<Plug>VimwikiListPrevSymbol')
call vimwiki#u#map_key('i', '<C-L><C-M>', '<Plug>VimwikiListToggle')
call vimwiki#u#map_key('n', 'glr', '<Plug>VimwikiRenumberList')
call vimwiki#u#map_key('n', 'gLr', '<Plug>VimwikiRenumberAllLists')
call vimwiki#u#map_key('n', 'gLR', '<Plug>VimwikiRenumberAllLists', 1)
call vimwiki#u#map_key('n', 'gl', '<Plug>VimwikiRemoveSingleCB')
call vimwiki#u#map_key('n', 'gL', '<Plug>VimwikiRemoveCBInList')
call vimwiki#u#map_key('n', 'o', '<Plug>VimwikiListo')
call vimwiki#u#map_key('n', 'O', '<Plug>VimwikiListO')

" change symbol for bulleted lists
for s:char in vimwiki#vars#get_syntaxlocal('bullet_types')
    if !hasmapto(':VimwikiChangeSymbolTo '.s:char.'<CR>')
        exe 'noremap <silent><buffer> gl'.s:char.' :VimwikiChangeSymbolTo '.s:char.'<CR>'
    endif
    if !hasmapto(':VimwikiChangeSymbolInListTo '.s:char.'<CR>')
        exe 'noremap <silent><buffer> gL'.s:char.' :VimwikiChangeSymbolInListTo '.s:char.'<CR>'
    endif
endfor

" change symbol for numbered lists
for s:typ in vimwiki#vars#get_syntaxlocal('number_types')
    if !hasmapto(':VimwikiChangeSymbolTo '.s:typ.'<CR>')
        exe 'noremap <silent><buffer> gl'.s:typ[0].' :VimwikiChangeSymbolTo '.s:typ.'<CR>'
    endif
    if !hasmapto(':VimwikiChangeSymbolInListTo '.s:typ.'<CR>')
        exe 'noremap <silent><buffer> gL'.s:typ[0].' :VimwikiChangeSymbolInListTo '.s:typ.'<CR>'
    endif
endfor

" insert items in a list using langmap characters (see :h langmap)
if !empty(&langmap)
    " Valid only if langmap is a comma separated pairs of chars
    let s:l_o = matchstr(&langmap, '\C,\zs.\zeo,')
    if s:l_o
        exe 'nnoremap <silent><buffer> '.s:l_o.' :call vimwiki#lst#kbd_o()<CR>a'
    endif

    let s:l_O = matchstr(&langmap, '\C,\zs.\zeO,')
    if s:l_O
        exe 'nnoremap <silent><buffer> '.s:l_O.' :call vimwiki#lst#kbd_O()<CR>a'
    endif
endif
