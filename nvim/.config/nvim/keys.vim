" Mappings
" Leader
let mapleader = ' '
noremap <Space> <NOP>

" Buffers
noremap <silent> <TAB> :bnext<CR>
noremap <silent> <S-TAB> :bprevious<CR>
noremap <silent> <M-d> :Bdelete<CR>

" Tabs
noremap <silent> <C-n> :tabnext<CR>
noremap <silent> <C-p> :tabprevious<CR>

" Windows - Navigation
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-\> <C-w>p

" Windows - Resize
noremap <silent> <M-k> :resize -2<CR>
noremap <silent> <M-j> :resize +2<CR>
noremap <silent> <M-h> :vertical resize -2<CR>
noremap <silent> <M-l> :vertical resize +2<CR>
noremap <silent> <M-f> :MaximizerToggle!<CR>
noremap <silent> <M-g> :Goyo<CR>
map <M-=> <C-w>=

" Move lines
nnoremap <silent> <M-d> :m .+1<CR>==
nnoremap <silent> <M-u> :m .-2<CR>==
vnoremap <silent> <M-d> :m '>+1<CR>gv=gv
vnoremap <silent> <M-u> :m '<-2<CR>gv=gv

" which-key config
call which_key#register('<Space>', 'g:which_key_map')
nnoremap <silent> <Leader> :silent <C-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :silent <C-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

augroup which-key
      autocmd! FileType which_key
      autocmd  FileType which_key set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
augroup END

" Single Mappings
let g:which_key_map[' '] = ['w',                                             'write']
let g:which_key_map['-'] = ['<C-w>s',                                        'split-below']
let g:which_key_map['.'] = ['Bufonly',                                       'only-buffer']
let g:which_key_map[';'] = ['Files',                                         'files']
let g:which_key_map['\'] = ['<C-w>v',                                        'split-right']
let g:which_key_map['b'] = ['GBranches',                                     'git-branches']
let g:which_key_map['c'] = ['<Plug>(coc-cursors-position)',                  'cursors-position']
let g:which_key_map['d'] = ['Bwipeout',                                      'delete-buffer']
let g:which_key_map['e'] = [':CocCommand explorer --toggle --sources=file+', 'explorer']
let g:which_key_map['f'] = ['Format',                                        'format']
let g:which_key_map['i'] = [':CocFzfList diagnostics --current-buf',         'issues/diagnostics']
let g:which_key_map['I'] = [':CocFzfList diagnostics',                       'all-issues/diagnostics']
let g:which_key_map['j'] = [':call ToggleGstatus(0)',                        'git-status']
let g:which_key_map['J'] = [':call ToggleGstatus(1)',                        'git-status-vertical']
let g:which_key_map['l'] = [':call asyncrun#quickfix_toggle(8)',             'quickfix-list']
let g:which_key_map['o'] = ['OR',                                            'organize-imports']
let g:which_key_map['P'] = [':AsyncRun git push',                            'git-push']
let g:which_key_map['p'] = ['Gpull',                                         'git-pull']
let g:which_key_map['q'] = ['<Plug>(coc-fix-current)',                       'quickfix']
let g:which_key_map['Q'] = ['q',                                             'quit']
let g:which_key_map['r'] = ['<Plug>(coc-range-select)',                      'range-select']
let g:which_key_map['R'] = ['<Plug>(coc-range-select-backward)',             'range-select-backward']
let g:which_key_map['s'] = ['Rg',                                            'search']
let g:which_key_map['u'] = ['UndotreeToggle',                                'undotree']
let g:which_key_map['x'] = ['<Plug>(coc-cursors-operator)',                  'cursors-operator']
let g:which_key_map['y'] = [':CocFzfList yank',                              'yank']

map <silent> <Leader>/ :Commentary<CR>
let g:which_key_map['/'] = 'commentary'

nnoremap <silent> <Leader>D :bufdo :Bwipeout<CR>
let g:which_key_map.D = 'delete-all-buffers'

nmap <silent> <Leader>z <Plug>(coc-cursors-word)
xmap <silent> <Leader>z <Plug>(coc-cursors-range)
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
      \ 'x': ['SplitjoinSplit',                'split-lines'],
      \ 'y': [':%y+',                          'yank-file'],
      \ 'a': 'align',
      \ 'd': 'documentation-generator',
      \ 'p': 'paste-file',
      \ 's': 'sort',
      \ 'v': 'visual-convert-snippet'
      \ }

map <Leader>aa <Plug>(EasyAlign)
xmap <Leader>as :sort i<CR>
nmap <Leader>ap ggVG"+p
xmap <Leader>av <Plug>(coc-convert-snippet)

" G(it) Mappings
let g:which_key_map.g = {
      \ 'name': '+git',
      \ 's': [':call ToggleGstatus(0)',      'status'],
      \ 'b': ['GBranches',                   'branches'],
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

map <silent> <Leader>ws :RgVW<CR>

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

map <Leader>1 <Plug>AirlineSelectTab1
map <Leader>2 <Plug>AirlineSelectTab2
map <Leader>3 <Plug>AirlineSelectTab3
map <Leader>4 <Plug>AirlineSelectTab4
map <Leader>5 <Plug>AirlineSelectTab5
map <Leader>6 <Plug>AirlineSelectTab6
map <Leader>7 <Plug>AirlineSelectTab7
map <Leader>8 <Plug>AirlineSelectTab8
map <Leader>9 <Plug>AirlineSelectTab9
map <Leader>0 <Plug>AirlineSelectTab0
