" https://github.com/airblade/vim-gitgutter

" Set the sign column background to black (update jellybeans colorscheme)
" exec "hi SignColumn ctermbg=".g:jellybeans_background_color_256

let g:gitgutter_sign_column_always = 1

noremap  <F3> :GitGutterToggle<cr>
inoremap <F3> <esc>:GitGutterToggle<cr>

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk
