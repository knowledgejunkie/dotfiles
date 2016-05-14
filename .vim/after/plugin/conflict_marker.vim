" https://github.com/rhysd/conflict-marker.vim

let g:conflict_marker_enable_mappings = 0

" The default ]x and [x are provided by vim-unimpaired
" using the ]n and [n pairwise mappings

" nnoremap ]x :ConflictMarkerNextHunk<CR>
" nnoremap [x :ConflictMarkerPrevHunk<CR>
"
" Remap the conflict-management bindings to be more
" fugitive-like (i.e. <Leader>g<something>)
nnoremap <Leader>gct :ConflictMarkerThemselves<CR>
nnoremap <Leader>gco :ConflictMarkerOurselves<CR>
nnoremap <Leader>gcn :ConflictMarkerNone<CR>
nnoremap <Leader>gcb :ConflictMarkerBoth<CR>
