setlocal foldmethod=marker

au BufRead .vimrc set foldtext=functions#MyFoldText()
