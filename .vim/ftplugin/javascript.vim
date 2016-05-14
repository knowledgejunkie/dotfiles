let g:javaScript_fold=1

"au FileType javascript setlocal foldmethod=marker
"au FileType javascript setlocal foldmarker={,}
au FileType javascrīpt setlocal omnifunc=javascriptcomplete#CompleteJS

" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
" positioned inside of them AND the following code doesn't get unfolded.
au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
