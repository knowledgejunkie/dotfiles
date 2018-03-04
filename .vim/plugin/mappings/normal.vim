" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Shift whole lines up/down with automatic indenting
" (this may indent the whole file from scratch, so beware)
"   http://vimrcfu.com/snippet/77 (V-mode)
nnoremap <C-Down> :m+1<CR>==
nnoremap <C-Up> :m-2<CR>==

nnoremap <C-u> gUiw

" Yank from the cursor to the end of the line
nnoremap Y y$

" Make D behave
nnoremap D d$

" Swap 0 and ^
nnoremap 0 ^
nnoremap ^ 0

" Easier to type if you don't use the default behaviour.
noremap H ^
noremap L $

" Easy buffer navigation
" - clashes with vim-tmux-navigator
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

" Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
"   https://github.com/airblade/dotvim/blob/master/vimrc
nnoremap <expr><silent> <Bar> v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"
nnoremap <expr><silent> _     v:count == 0 ? "<C-W>s<C-W><Down>"  : ":<C-U>normal! ".v:count."_<CR>"

" Use tab and shift-tab to cycle through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Formatting, TextMate-style
nnoremap Q gqip

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Use sane regexes.
nnoremap / /\v

" Remap comma (used as <Leader>) to preserve reverse char search
nnoremap \ ,

" Avoid Caps Lock errors
nnoremap ZZ zz

" Don't move on *
nnoremap * *<C-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Include flags when repeating last substition
nnoremap & :&&<CR>

" Space to toggle folds.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" [z and ]z already jump to start/end of open fold, so let [Z and ]Z do the
" same for closed folds. zj/zk to move between folds.
nnoremap [Z zo[z
nnoremap ]Z zo]z

" Disable default help binding
nnoremap <F1> <Nop>
