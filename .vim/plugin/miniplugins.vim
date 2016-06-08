" Ag motions {{{1
"   Documentation {{{2
" Motions to Ag for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.
"       Ag searches line-by-line.

"   Functions {{{2
function! s:AgMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ag! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

function! s:CopyMotionForType(type) abort
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

"   Public interface {{{2
nnoremap <silent> <Plug>AgForMotion     :<C-U>set opfunc=<SID>AgMotion<CR>g@
vnoremap <silent> <Plug>AgForSelection  :<C-U>call <SID>AgMotion(visualmode())<CR>

" Quickfix Sort {{{1
"   Documentation {{{2
"     https://gist.github.com/AndrewRadev/afd11c8b1f64a1c35e93

" If you've executed a grep/ack/ag command and you have a bunch of stuff in your
" quickfix window, but want to add another grep to it, this could help:
"
"   :Ack ProjectCollaborator
"   :Qfappend Ack UserCollaborator
"
" This will add the new search results to the end of the quickfix list,
" instead of replacing it. You could also put swap the order by using
" :Qfprepend
"
"   :Ack ProjectCollaborator
"   :Qfprepend Ack UserCollaborator
"
" Duplicates should automatically be removed (two hits on the same line in the
" same file). However, the order is going to be the exact order of the first
" list + second list. To sort the current quickfix list alphabetically on the
" filename, use :Qfsort
"
"   :Ack ProjectCollaborator
"   :Qfappend Ack UserCollaborator
"   :Qfsort
"
" You can also provide :Qfsort with a command and it'll execute that first,
" allowing you to do:
"
"   :Ack ProjectCollaborator
"   :Qfsort Qfappend Ack UserCollaborator
"

"   Functions {{{2
function! s:Qfappend(command) abort
    let qflist = getqflist()
    exe a:command
    call extend(qflist, getqflist())

    call setqflist(qflist)
endfunction

function! s:Qfprepend(command) abort
    let qflist = getqflist()
    exe a:command
    call extend(qflist, getqflist(), 0)

    call setqflist(qflist)
endfunction

function! s:Qfsort(command) abort
    if a:command != ''
        " there's a quickfix-related command given, execute it first
        try
            exe a:command
        catch
            " don't try to sort if there's an error, just bail out
            echoerr v:exception
            return
        endtry
    endif

    let qflist = copy(getqflist())
    call sort(qflist, function(s:sid.'QfsortCompare'))
    call setqflist(qflist)
endfunction

function! s:QfsortCompare(x, y) abort
    let x_name = bufname(a:x.bufnr)
    let y_name = bufname(a:y.bufnr)

    if x_name < y_name
        return -1
    elseif x_name > y_name
        return 1
    else
        return 0
    else
endfunction

" Get this file's sid. Taken almost directly from rails.vim:
map <SID>xx <SID>xx
let s:sid = substitute(maparg("<SID>xx"), 'xx$', '', '')
unmap <SID>xx

"   Public interface {{{2
command! -nargs=* -complete=command Qfappend call s:Qfappend(<q-args>)
command! -nargs=* -complete=command Qfprepend call s:Qfprepend(<q-args>)
command! -nargs=* -complete=command Qfsort call s:Qfsort(<q-args>)

" Pulse Line {{{1
"   Function {{{2
function! miniplugins#Pulse() abort
    let current_window = winnr()
    windo set nocursorline
    execute current_window . 'wincmd w'
    setlocal cursorline

    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 9
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction
" }}}
"   Public interface {{{2
command! -nargs=0 Pulse call miniplugins#Pulse()

" Highlight Word {{{1
"   Documentation {{{2
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
"
"   Functions {{{2
function! s:HiInterestingWord(n) abort
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction

"   Default Highlights {{{2
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

"   Public interface {{{2
nnoremap <silent> <Plug>HiInterestingWord1  :call <SID>HiInterestingWord(1)<CR>
nnoremap <silent> <Plug>HiInterestingWord2  :call <SID>HiInterestingWord(2)<CR>
nnoremap <silent> <Plug>HiInterestingWord3  :call <SID>HiInterestingWord(3)<CR>
nnoremap <silent> <Plug>HiInterestingWord4  :call <SID>HiInterestingWord(4)<CR>
nnoremap <silent> <Plug>HiInterestingWord5  :call <SID>HiInterestingWord(5)<CR>
nnoremap <silent> <Plug>HiInterestingWord6  :call <SID>HiInterestingWord(6)<CR>
