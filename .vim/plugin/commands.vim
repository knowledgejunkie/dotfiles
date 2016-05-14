command! -nargs=0 Pulse call s:Pulse()

command! -nargs=* -complete=command Qfappend call s:Qfappend(<q-args>)
command! -nargs=* -complete=command Qfprepend call s:Qfprepend(<q-args>)
command! -nargs=* -complete=command Qfsort call s:Qfsort(<q-args>)

