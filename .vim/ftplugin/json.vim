setlocal autoindent
setlocal formatoptions=tcq2l
setlocal textwidth=78
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=8
setlocal expandtab
setlocal foldmethod=syntax

" tidy/pretty-print via json_pp
nnoremap <Leader>jt :%!json_pp<cr>
vnoremap <Leader>jt :!json_pp<cr>
