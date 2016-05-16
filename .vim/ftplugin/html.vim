setlocal foldmethod=manual
setlocal omnifunc=htmlcomplete#CompleteTags

" Use <LocalLeader>f to fold the current tag.
nnoremap <buffer> <LocalLeader>f Vatzf

" Use <LocalLeader>t to fold the current templatetag.
nnoremap <buffer> <LocalLeader>t viikojozf

" Indent tag
nnoremap <buffer> <LocalLeader>= Vat=

" tidy/pretty-print via tidy
nnoremap <Leader>ht :%!tidy -indent -quiet --show-errors 0 --show-warnings 0<cr>
vnoremap <Leader>ht :!tidy -indent -quiet --show-errors 0 --show-warnings 0<cr>
