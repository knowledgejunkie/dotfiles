" Hints from the Python coding standards at:
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc

let python_highlight_all=1

au FileType python setlocal foldmethod=indent

au BufRead,BufNewFile *.py,*.pyw setlocal expandtab tabstop=8 textwidth=79 shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw match ErrorMsg /^\t\+\|\s\+$/
