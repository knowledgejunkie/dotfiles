set showtabline=2

" As most of my work is in git repos, I try to present the filename and path
" relative to the repo root, instead of just the filename.
"
" Note that the vim-rooter plugin sets the cwd to the repo root automatically.
"
" Also see https://github.com/itchyny/lightline.vim/issues/87

" Sort of emulate vim-airline's buffer list using vim-bufferline
" See https://github.com/itchyny/lightline.vim/issues/155
function! LightlineBufferline()
  call bufferline#refresh_status()
  return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
endfunction

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightLineGetAbsoluteFilename()
  return expand('%:p:h')
endfunction

function! LightLineGetRelativeFilename()
  return fnamemodify(expand('%'), ':~:.')
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo' ? '' :
        \ &ft == 'help' ? fname :
        \ ('' != fname ? LightLineGetRelativeFilename() : '[No Name]')
endfunction

function! LightLineGitRepo()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo' && exists('*fugitive#head')
      return fnamemodify(getcwd(), ":t")
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineGitBranch()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark . ' ' . branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineGitGutter()
  if exists('*GitGutterGetHunkSummary')
    let [ added, modified, removed ] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', added, modified, removed)
  endif
  return ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' && &fenc !=# 'utf-8' ? &fenc : '') : ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat !=# 'unix' ? &fileformat : '') : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" If syntastic is loaded, call lightline#update after SyntasticCheck
if g:loaded_syntastic_plugin
    function! s:syntastic() abort
        SyntasticCheck
        call lightline#update()
    endfunction

    autocmd BufRead * call s:syntastic()
    autocmd BufWritePost * call s:syntastic()

    function! LightLineSyntasticStatus()
        return SyntasticStatuslineFlag()
    endfunction
else
    function! LightLineSyntasticStatus()
        return ""
    endfunction
endif " }}}
