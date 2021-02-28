" which-key config
call which_key#register('<space>', 'g:which_key_map')
nnoremap <silent> <leader> :silent <C-u> :silent WhichKey '<space>'<CR>
vnoremap <silent> <leader> :silent <C-u> :silent WhichKeyVisual '<space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

augroup which_key
      autocmd! FileType which_key
      autocmd  FileType which_key set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
augroup end

" Single Mappings
let g:which_key_map[' '] = ['w',                                             'write']
let g:which_key_map[';'] = ['Files',                                         'files']
let g:which_key_map['-'] = ['<C-w>s',                                        'split-below']
let g:which_key_map['\'] = ['<C-w>v',                                        'split-right']
let g:which_key_map['.'] = ['Bufonly',                                       'only-buffer']
let g:which_key_map['b'] = ['Twiggy',                                        'git-branches']
let g:which_key_map['c'] = ['<Plug>(coc-cursors-position)',                  'cursors-position']
let g:which_key_map['d'] = ['Bwipeout',                                      'delete-buffer']
let g:which_key_map['e'] = [':CocCommand explorer --toggle --sources=file+', 'explorer']
let g:which_key_map['f'] = ['Format',                                        'format']
let g:which_key_map['i'] = [':CocFzfList diagnostics --current-buf',         'issues/diagnostics']
let g:which_key_map['I'] = [':CocFzfList diagnostics',                       'all-issues/diagnostics']
let g:which_key_map['j'] = ['G',                                             'git-status']
let g:which_key_map['l'] = [':call asyncrun#quickfix_toggle(8)',             'quickfix-list']
let g:which_key_map['o'] = ['OR',                                            'organize-imports']
let g:which_key_map['r'] = ['<Plug>(coc-range-select)',                      'range-select']
let g:which_key_map['R'] = ['<Plug>(coc-range-select-backward)',             'range-select-backward']
let g:which_key_map['p'] = ['Gpull',                                         'git-pull']
let g:which_key_map['P'] = [':AsyncRun git push',                            'git-push']
let g:which_key_map['s'] = ['Rg',                                            'search']
let g:which_key_map['u'] = ['UndotreeToggle',                                'undotree']
let g:which_key_map['q'] = ['<Plug>(coc-fix-current)',                       'quickfix']
let g:which_key_map['Q'] = ['q',                                             'quit']
let g:which_key_map['x'] = ['<Plug>(coc-cursors-operator)',                  'cursors-operator']
let g:which_key_map['y'] = [':CocFzfList yank',                              'yank']

nmap <silent> <leader>/ :Commentary<CR>
xmap <silent> <leader>/ :Commentary<CR>
let g:which_key_map['/'] = 'commentary'

nnoremap <silent> <leader>D :bufdo :Bwipeout<CR>
let g:which_key_map.D = 'delete-all-buffers'

nmap <silent> <leader>z <Plug>(coc-cursors-word)
xmap <silent> <leader>z <Plug>(coc-cursors-range)
let g:which_key_map.z = 'cursors-word'

" A(ction) Mappings
let g:which_key_map.a = {
      \ 'name': '+action',
      \ 'c': ['<Plug>(coc-codeaction-cursor)', 'codeaction-cursor'],
      \ 'f': ['<Plug>(coc-format-selected)',   'format-selected'],
      \ 'j': ['SplitjoinJoin',                 'join-lines'],
      \ 'l': ['<Plug>(coc-codeaction-line)',   'codeaction-line'],
      \ 'q': ['<Plug>(coc-fix-current)',       'quickfix'],
      \ 'r': ['<Plug>(coc-rename)',            'rename'],
      \ 's': ['SplitjoinSplit',                'split-lines'],
      \ 'y': [':%y+',                          'yank-file'],
      \ 'a': 'align',
      \ 'd': 'documentation-generator',
      \ 'p': 'paste-file',
      \ 'x': 'visual-convert-snippet'
      \ }

nmap <leader>aa <Plug>(EasyAlign)
xmap <leader>aa <Plug>(EasyAlign)
nmap <leader>ap ggVG"+p
xmap <leader>ax <Plug>(coc-convert-snippet)

" G(it) Mappings
let g:which_key_map.g = {
      \ 'name': '+git',
      \ 's': ['G',                           'status'],
      \ 'b': ['Twiggy',                      'branches'],
      \ 'B': [':CocCommand git.browserOpen', 'browse'],
      \ 'c': ['Gcommit',                     'commit'],
      \ 'i': [':CocFzfList issues',          'issues'],
      \ 'p': ['Gpull',                       'pull'],
      \ 'P': [':AsyncRun git push',          'push'],
      \ 'g': [':diffget //2',                'diff-left'],
      \ 'h': [':diffget //3',                'diff-right']
      \ }

" W(iki) Mappings
let g:which_key_map.w = {
      \ 'name': '+wiki',
      \ 'f': [':Files $VIMWIKI_PATH', 'files'],
      \ 'i': 'diary',
      \ 's': 'search',
      \ 't': 'tab',
      \ 'w': 'win',
      \ }

nmap <silent> <leader>ws :RgVW<CR>

let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'
let g:which_key_map.0 = 'which_key_ignore'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

