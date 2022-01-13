function! s:MapNotHasMapTo(lhs, rhs, modes)
    if !hasmapto('<Plug>' . a:rhs)
        for mode in split(a:modes, '\zs')
            execute mode . 'map <buffer> ' . a:lhs . ' <Plug>' . a:rhs
        endfor
    endif
endfunction

call <sid>MapNotHasMapTo(']]', 'Markdown_MoveToNextHeader', 'nv')
call <sid>MapNotHasMapTo('[[', 'Markdown_MoveToPreviousHeader', 'nv')
call <sid>MapNotHasMapTo('][', 'Markdown_MoveToNextSiblingHeader', 'nv')
call <sid>MapNotHasMapTo('[]', 'Markdown_MoveToPreviousSiblingHeader', 'nv')
call <sid>MapNotHasMapTo(']u', 'Markdown_MoveToParentHeader', 'nv')
call <sid>MapNotHasMapTo(']c', 'Markdown_MoveToCurHeader', 'nv')
call <sid>MapNotHasMapTo('<C-c>', 'Markdown_Checkbox', 'n')
call <sid>MapNotHasMapTo('<C-k>', 'Markdown_CreateLink', 'vi')
call <sid>MapNotHasMapTo('<CR>', 'Markdown_FollowLink', 'n')
