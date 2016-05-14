" https://github.com/rking/ag.vim

let g:ag_prg = "ag --vimgrep --hidden"
let g:ag_working_path_mode = "r"
let g:ag_highlight = 1
let g:ag_mapping_message = 0

" Ag for given word
nnoremap <Leader>a :Ag!<space>

" Ag for the last search.
nnoremap <silent> <Leader>/ :AgFromSearch!<CR>
