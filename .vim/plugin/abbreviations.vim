iabbrev kj@ knowledgejunkie@gmail.com
iabbrev nm@ Nick Morrott <knowledgejunkie@gmail.com>

" Open help in a new tab (vim-scriptease hard codes help in vsplit)
"   https://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit/7515418#7515418
cnoreabbrev <expr> h    getcmdtype() == ":" && getcmdline() == 'h'    ? 'tab help' : 'h'
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'
