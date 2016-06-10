" https://github.com/svermeulen/vim-easyclip

imap <Insert> <Plug>EasyClipInsertModePaste
cmap <Insert> <Plug>EasyClipCommandModePaste

" So we don't clobber 'm', now 'x' takes a motion
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug
