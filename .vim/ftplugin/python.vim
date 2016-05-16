" Hints from the Python coding standards at:
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc

let python_highlight_all=1

setlocal foldmethod=indent

setlocal expandtab tabstop=8 textwidth=79 shiftwidth=4
match ErrorMsg /^\t\+\|\s\+$/
