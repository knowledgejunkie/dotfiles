" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for
" syntax highlighting purposes.
" More on why: https://github.com/thoughtbot/dotfiles/pull/471
let g:is_posix=1

let g:sh_fold_enabled=1

au FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
