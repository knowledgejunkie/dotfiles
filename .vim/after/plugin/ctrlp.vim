" https://github.com/kien/ctrlp.vim

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 20
let g:ctrlp_show_hidden = 0

let g:ctrlp_prompt_mappings = {
            \ 'PrtSelectMove("j")':   ['<C-j>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<C-k>', '<up>'],
            \ 'PrtHistory(-1)':       ['<C-n>'],
            \ 'PrtHistory(1)':        ['<C-p>'],
            \ 'ToggleFocus()':        ['<C-tab>'],
            \ }

let ctrlp_filter_greps = "".
            \ "egrep -iv '\\.(" .
            \ "jar|class|log|so|o|pyc|jpe?g|png|gif|mo|po" .
            \ ")$' | " .
            \ "egrep -v '^(\\./)?(" .
            \ ".git/|.hg/|.svn/|CVS/" .
            \ ")'"

let my_ctrlp_user_command = "find %s '(' -type f -or -type l ')' | " . ctrlp_filter_greps
let my_ctrlp_git_command = "cd %s && git ls-files | " . ctrlp_filter_greps
let my_ctrlp_hg_command = "hg --cwd %s locate -I . | " . ctrlp_filter_greps

let g:ctrlp_user_commanD = {
            \ 'types': {
            \ 1: ['.git', my_ctrlp_git_command],
            \ 2: ['.hg', my_ctrlp_hg_command],
            \ },
            \ 'fallback': my_ctrlp_user_command
            \ }

nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>t :CtrlPTag<CR>
