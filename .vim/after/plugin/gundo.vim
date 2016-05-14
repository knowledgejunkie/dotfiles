" https://github.com/sjl/gundo.vim

let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"

nnoremap <F5> :GundoToggle<CR>
inoremap <F5> <esc>:GundoToggle<CR>
