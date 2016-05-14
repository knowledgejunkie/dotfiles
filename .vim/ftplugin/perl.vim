" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:perl_include_pod = 1
" let g:perl_extended_vars = 1

" au FileType perl setlocal foldmethod=syntax

" Perltidy support
" http://publius-ovidius.livejournal.com/242806.html
nnoremap <Leader>pt :%!perltidy -q<cr>
vnoremap <Leader>pt :!perltidy -q<cr>

" Perldoc support
" http://publius-ovidius.livejournal.com/242806.html
nnoremap <Leader>pd :!perldoc %<cr>
