" Clear match highlighting
nmap <silent> <Leader><space> <Plug>(LoupeClearHighlight)

" Silence errors (E385/E386) from search navigation (e.g. when using nowrapscan)
function! SilentlyMatch(searchType)
    silent! execute "normal! " . a:searchType
endfunction

" Update maps to avoid errors when navigating searches
execute 'nnoremap <silent> n ' . ':call SilentlyMatch("n")<CR>' . 'zzzv' . ':call loupe#hlmatch()<CR>'
execute 'nnoremap <silent> N ' . ':call SilentlyMatch("N")<CR>' . 'zzzv' . ':call loupe#hlmatch()<CR>'

" Do not move the cursor after */#
" FIXME - these maps still generate E385/E386 errors
execute 'nnoremap <silent> # #<C-O>' . 'zzzv' . ':call loupe#hlmatch()<CR>'
execute 'nnoremap <silent> * *<C-O>' . 'zzzv' . ':call loupe#hlmatch()<CR>'
execute 'nnoremap <silent> g# g#<C-O>' . 'zzzv' . ':call loupe#hlmatch()<CR>'
execute 'nnoremap <silent> g* g*<C-O>' . 'zzzv' . ':call loupe#hlmatch()<CR>'
