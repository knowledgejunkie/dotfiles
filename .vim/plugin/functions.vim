" Visual star search (updated version from Practical Vim)
function! functions#VSetSearch() abort
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" Custom FoldText
function! functions#MyFoldText() abort
    let line = getline(v:foldstart)

    "Note: need to fixup overall line width to take into account:
    " - extra spacing used by Syntastic, or disable signs in Syntastic config
    " - apparent different in handling of relativenumber vs number
    " - fact that placement at end of line is different if numbering off
    let nucolwidth = &fdc + &number * &numberwidth + &relativenumber * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction

" Switch to plaintext mode with: call functions#plaintext()
function! functions#Plaintext() abort
    setlocal nolist
    setlocal spell
    setlocal textwidth=0
    setlocal wrap
    setlocal wrapmargin=0

    nnoremap <buffer> j gj
    nnoremap <buffer> k gk

    " Ideally would keep 'list' set, and restrict 'listchars' to just show
    " whitespace errors, but 'listchars' is global and I don't want to go through
    " the hassle of saving and restoring.
    if has('autocmd')
        autocmd BufWinEnter <buffer> match Error /\s\+$/
        autocmd InsertEnter <buffer> match Error /\s\+\%#\@<!$/
        autocmd InsertLeave <buffer> match Error /\s\+$/
        autocmd BufWinLeave <buffer> call clearmatches()
    endif
endfunction
