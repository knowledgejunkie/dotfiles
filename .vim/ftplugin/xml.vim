let g:xml_syntax_folding=1

"au FileType xml setlocal foldmethod=syntax
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal omnifunc=xmlcomplete#CompleteTags

" tidy/pretty-print via xml_pp
nnoremap <Leader>xt :%!xml_pp<cr>
vnoremap <Leader>xt :!xml_pp<cr>
