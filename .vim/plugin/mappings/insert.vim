" jj to quickly exit Insert mode
inoremap jj <Esc>

inoremap <S-Tab> <C-V><Tab>

inoremap # X#

" Shift whole lines up/down with automatic indenting
" (this may indent the whole file from scratch, so beware)
"   http://vimrcfu.com/snippet/77 (V-mode)
inoremap <C-Down> <Esc>:m+1<CR>==i
inoremap <C-Up> <Esc>:m-2<CR>==i

" "Uppercase current word
"
" This mapping allows you to press <C-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <C-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <C-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" Insert Mode Completion
inoremap <C-f> <C-x><C-f>
inoremap <C-]> <C-x><C-]>

" Disable default help binding
inoremap <F1> <Nop>
