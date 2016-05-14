au FileType html setlocal foldmethod=manual
au FileType html setlocal omnifunc=htmlcomplete#CompleteTags

" Use <LocalLeader>f to fold the current tag.
au FileType html nnoremap <buffer> <LocalLeader>f Vatzf

" Use <LocalLeader>t to fold the current templatetag.
au FileType html nnoremap <buffer> <LocalLeader>t viikojozf

" Indent tag
au FileType html nnoremap <buffer> <LocalLeader>= Vat=

" tidy/pretty-print via tidy
nnoremap <Leader>ht :%!tidy -indent -quiet --show-errors 0 --show-warnings 0<cr>
vnoremap <Leader>ht :!tidy -indent -quiet --show-errors 0 --show-warnings 0<cr>
