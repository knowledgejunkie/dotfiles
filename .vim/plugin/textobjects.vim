" Next and Last {{{1
"
" Motion for "next/last object". For example, "din(" would go to the
" next "() pair and delete its contents.

onoremap an :<C-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<C-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<C-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<C-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<C-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<C-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<C-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<C-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
    let c = nr2char(getchar())

    if c ==# "b"
        let c = "("
    elseif c ==# "B"
        let c = "{"
    elseif c ==# "r"
        let c = "["
    endif

    exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" Integers {{{1
"
" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^
" TODO: Handle floats.

onoremap N :<C-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<C-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<C-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<C-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<C-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<C-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction

