" which-key config
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :silent <C-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}                                   " Create map to add keys to
let g:which_key_sep = '→'                                   " Define a separator
let g:which_key_timeout = 100                               " timeout
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'} " display icons
let g:which_key_use_floating_win = 0                        " better looking floating win
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single Mappings
let g:which_key_map['/'] = ['<Plug>NERDCommenterToggle',                     'comment']
let g:which_key_map[';'] = ['Commands',                                      'commands']
let g:which_key_map['-'] = ['<C-w>s',                                        'split-below']
let g:which_key_map['|'] = ['<C-w>v',                                        'split-right']
let g:which_key_map['d'] = ['Bdelete',                                       'delete-buffer']
let g:which_key_map['e'] = [':CocCommand explorer --toggle --sources=file+', 'explorer']
let g:which_key_map['f'] = [':call OrganizeFormat()',                        'organize/format']
let g:which_key_map['i'] = ['CocDiagnostics',                                'issues/diagnostics']
let g:which_key_map['o'] = ['Files',                                         'open-file']
let g:which_key_map['s'] = ['Rg',                                            'search']
let g:which_key_map['u'] = ['UndotreeToggle',                                'undotree']
let g:which_key_map['q'] = ['q',                                             'quit']
let g:which_key_map['w'] = ['w',                                             "write/save"]

" A(ction) Mappings
let g:which_key_map.a = {
      \ 'name': '+action',
      \ 'f': ['<Plug>(coc-fix-current)', 'fix']
      \ }

nmap <leader>aa <Plug>(EasyAlign)
xmap <leader>aa <Plug>(EasyAlign)
let g:which_key_map.a.a = 'align'

nmap <leader>al v<Plug>(coc-codeaction-selected)<esc>
let g:which_key_map.a.l = 'list'

" G(it) Mappings
let g:which_key_map.g = {
  \ 'name': '+git',
  \ 's': ['G',            'status'],
  \ 'b': ['GBranches',    'branches'],
  \ 'B': ['GBrowse',      'browse'],
  \ 'c': ['Gcommit',      'commit'],
  \ 'p': ['Gpush',        'push'],
  \ 'P': ['Gpull',        'pull'],
  \ 'g': [':diffget //2', 'diff left'],
  \ 'h': [':diffget //3', 'diff right']
  \ }
