" https://github.com/svermeulen/vim-easyclip

let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipAutoFormat = 1
let g:EasyClipUseCutDefaults = 0

imap <Insert> <Plug>EasyClipInsertModePaste
cmap <Insert> <Plug>EasyClipCommandModePaste

" So we don't clobber 'm', now 'x' takes a motion
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug
