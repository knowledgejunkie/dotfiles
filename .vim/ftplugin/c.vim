setlocal foldmethod=syntax
setlocal omnifunc=ccomplete#Complete

setlocal textwidth=79
setlocal formatoptions-=c formatoptions-=o formatoptions-=r

function! Select_c_style()
    if search('^\t', 'n', 150)
        setlocal shiftwidth=8
        setlocal noexpandtab
        setlocal tabstop=8
    else
        setlocal shiftwidth=4
        setlocal expandtab
        setlocal tabstop=4
    endif
endfunction
call Select_c_style()

" abbreviations for c programming
" http://stackoverflow.com/a/789284
function! LoadCAbbrevs()
    iabbr do do {<CR>} while ();<C-O>3h<C-O>
    iabbr for for (;;) {<CR>}<C-O>k<C-O>3l<C-O>
    iabbr switch switch () {<CR>}<C-O>k<C-O>6l<C-O>
    iabbr while while () {<CR>}<C-O>k<C-O>5l<C-O>
    iabbr if if () {<CR>}<C-O>k<C-O>2l<C-O>
    iabbr #d #define
    iabbr #i #include
endfunction
call LoadCAbbrevs()
