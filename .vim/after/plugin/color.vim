" Cursor colour {{{1
"
" Make cursor more obvious
au InsertLeave * hi Cursor guibg=red
au InsertEnter * hi Cursor guibg=green

" http://vim.wikia.com/wiki/Configuring_the_cursor
if &term =~ "xterm\\|rxvt"
    " use a green cursor in insert mode
    let &t_SI = "\<Esc>]12;green\x7"
    " use a red cursor otherwise
    let &t_EI = "\<Esc>]12;red\x7"
    silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
    " au VimLeave * silent !echo -ne "\033]112\007"
    au VimLeave * silent !echo -ne "\033]12;gray\007"
endif

