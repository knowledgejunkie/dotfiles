" Visual shifting (does not exit Visual mode)
"   https://github.com/spf13/spf13-vim/blob/master/.vimrc
vnoremap < <gv
vnoremap > >gv

" Shift whole lines up/down with automatic indenting
" (this may indent the whole file from scratch, so beware)
"   http://vimrcfu.com/snippet/77 (V-mode)
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

vnoremap ~ y:call setreg('', CycleCase(@"), getregtype(''))<CR>gv""Pgv

" Easier to type if you don't use the default behaviour.
vnoremap L g_

" Play macro across visual selection
vnoremap Q :norm @q<CR>

" Use sane regexes.
vnoremap / /\v

" Space to toggle folds.
vnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

xnoremap * :<C-u>call functions#VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call functions#VSetSearch()<CR>?<C-R>=@/<CR><CR>

" Include flags when repeating last substition
xnoremap & :&&<CR>

" Shortcut for [] text object
vnoremap ir i[
vnoremap ar a[

" Disable default help binding
vnoremap <F1> <Nop>

" Duplicate a selection
vnoremap D y'>p
