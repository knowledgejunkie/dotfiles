let g:xml_syntax_folding=1

"au FileType xml setlocal foldmethod=syntax
au FileType xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" tidy/pretty-print via xml_pp
nnoremap <Leader>xt :%!xml_pp<cr>
vnoremap <Leader>xt :!xml_pp<cr>
