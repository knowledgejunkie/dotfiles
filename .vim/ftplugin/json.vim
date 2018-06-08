setlocal autoindent
setlocal formatoptions=tcq2l
setlocal textwidth=78
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=8
setlocal expandtab
setlocal foldmethod=syntax

" tidy/pretty-print via json_xs
nnoremap <Leader>jt :%!json_xs<cr>
vnoremap <Leader>jt :!json_xs<cr>
