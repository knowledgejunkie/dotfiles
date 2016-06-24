setlocal foldmethod=syntax
setlocal foldlevelstart=1
let perl_fold=1
" let perl_fold_blocks = 1
let perl_include_pod = 1
let perl_extended_vars=1
let perl_sync_dist=250

" Perltidy support
" http://publius-ovidius.livejournal.com/242806.html
nnoremap <Leader>pt :%!perltidy -q<cr>
vnoremap <Leader>pt :!perltidy -q<cr>

" Perldoc support
" http://publius-ovidius.livejournal.com/242806.html
nnoremap <Leader>pd :!perldoc %<cr>
