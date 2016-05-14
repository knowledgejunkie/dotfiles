" https://github.com/duff/vim-scratch

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
        let w:is_scratch_window = 1
    endif
endfunction

command! ScratchToggle call ScratchToggle()

nnoremap <silent> <Leader><tab> :ScratchToggle<cr>
