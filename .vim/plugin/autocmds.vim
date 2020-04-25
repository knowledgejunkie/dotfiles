" Save all files when focus is lost
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Only show cursorline in the current window and in normal mode.
au BufRead,BufNewFile * set cursorline
au WinEnter * set cursorline
au WinLeave * set nocursorline
au InsertEnter * set nocursorline
au InsertLeave * set cursorline

" Make sure Vim returns to the same line when you reopen a file.
au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif

" Has to be an autocommand because repeat.vim eats the mapping otherwise :(
au VimEnter * :nnoremap U <C-r>

" Toggle hlsearch for insert mode
au InsertEnter * :set nohlsearch
au InsertLeave * :set hlsearch

" Update tags after every write? Requires git ctags hook
"   http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html#comment-283074229
"
" au BufWritePost *
"       \ if exists('b:git_dir') && executable(b:git_dir.'/hooks/ctags') |
"       \   call system('"'.b:git_dir.'/hooks/ctags" &') |
"       \ endif

au QuickfixCmdPost * Qfsort

au! User GoyoEnter nested call functions#Goyo_Enter()
au! User GoyoLeave nested call functions#Goyo_Leave()
