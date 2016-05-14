let g:php_folding=1

au Filetype php setlocal foldmethod=syntax
au FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
au FileType php setlocal omnifunc=phpcomplete#CompletePHP
