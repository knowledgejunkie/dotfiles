setlocal foldmethod=marker

au BufRead .vimrc set foldtext=functions#MyFoldText()

au BufWritePost .vimrc source %
