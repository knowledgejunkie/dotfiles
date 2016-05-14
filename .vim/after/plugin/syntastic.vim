" https://github.com/scrooloose/syntastic

" Recommended settings for plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Personal settings
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5
let g:syntastic_ignore_files = ['\m^/usr/']
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
