" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

function! airline#extensions#tabline#formatters#custom#format(bufnr, buffers)
  let buf = bufname(a:bufnr)
  let filename = fnamemodify(buf, ':t')

  if filename ==# 'index.js' || filename ==# 'index.jsx' || filename ==# 'index.ts' || filename ==# 'index.tsx' || filename ==# 'index.vue'
    return fnamemodify(buf, ':p:h:t') . '/i'
  elseif filename ==# 'styles.js' || filename ==# 'styles.ts' || filename ==# 'styles.jsx' || filename ==# 'styles.tsx' || filename ==# 'index.styles.js' || filename ==# 'index.styles.ts' || filename ==# 'styles.css' || filename ==# 'styles.scss'
    return fnamemodify(buf, ':p:h:t') . '/s'
 elseif filename ==# '__init__.py'
    return fnamemodify(buf, ':p:h:t') . '/_i_'
  else
    return airline#extensions#tabline#formatters#unique_tail_improved#format(a:bufnr, a:buffers)
  endif
endfunction
