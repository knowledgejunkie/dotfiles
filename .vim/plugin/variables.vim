let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ' '
let g:bufferline_active_buffer_right = ' '
let g:bufferline_show_bufnr = 0

let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1

let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipAutoFormat = 1
let g:EasyClipUseCutDefaults = 0


let g:UltiSnipsExpandTrigger = "<C-Space>"
let g:UltiSnipsJumpForwardTrigger = "<C-Space>"
let g:UltiSnipsJumpBackwardTrigger = "<S-C-Space>"
let g:UltiSnipsEditSplit = "vertical"

let g:ag_prg = "ag --vimgrep --hidden"
let g:ag_working_path_mode = "r"
let g:ag_highlight = 1
let g:ag_mapping_message = 0

let g:conflict_marker_enable_mappings = 0

let g:ctrlp_cmd = 'CtrlPMixed'
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

let g:ctrlp_filter_greps = "".
            \ "egrep -iv '\\.(" .
            \ "jar|class|log|so|o|pyc|jpe?g|png|gif|mo|po" .
            \ ")$' | " .
            \ "egrep -v '^(\\./)?(" .
            \ ".git/|.hg/|.svn/|CVS/" .
            \ ")'"

let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git','cd %s && git ls-files -co --exclude-standard'],
            \ 2: ['.hg', 'hg --cwd %s locate -I'],
            \ },
            \ 'fallback': "find %s -type f | " . g:ctrlp_filter_greps
            \ }

let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"
if has('python3')
    let g:gundo_prefer_python3 = 1
endif

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'tabline': {
      \   'left': [ ['bufferline'] ],
      \   'right': [ [ ] ],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode' ], [ 'git_repo', 'git_branch' ], [ 'filename', 'syntastic', 'ctrlpmark', 'paste', 'spell' ] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileencoding', 'fileformat', 'filetype', 'readonly' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ] ],
      \ },
      \ 'component': {
      \   'lineinfo': ' %-2v',
      \ },
      \ 'component_visible_condition': {
      \ },
      \ 'component_function': {
      \   'mode' : 'LightLineMode',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'LightLineFiletype',
      \   'ctrlpmark': 'CtrlPMark',
      \   'git_repo': 'LightLineGitRepo',
      \   'git_branch': 'LightLineGitBranch',
      \ },
      \ 'component_expand': {
      \   'bufferline': 'LightlineBufferline',
      \   'syntastic': 'LightLineSyntasticStatus',
      \   'readonly': 'LightLineReadonly',
      \   'fileencoding': 'LightLineFileencoding',
      \   'fileformat': 'LightLineFileformat',
      \ },
      \ 'component_type': {
      \   'bufferline': 'tabsel',
      \   'syntastic': 'error',
      \   'readonly': 'error',
      \   'fileencoding' : 'warning',
      \   'fileformat' : 'warning',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left':'', 'right': '' },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'V-LINE',
      \   "\<C-v>": 'V-BLOCK',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'S-LINE',
      \   "\<C-s>": 'S-BLOCK',
      \   't': 'TERM',
      \ },
      \ }

let g:pymode = 1
let g:pymode_doc = 1
let g:pymode_doc_key = '<LocalLeader>ds'
let g:pydoc = 'pydoc'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 0
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_run = 0
let g:pymode_lint = 0
let g:pymode_breakpoint = 0
let g:pymode_utils_whitespaces = 0
let g:pymode_virtualenv = 0
let g:pymode_folding = 0
let g:pymode_options_indent = 0
let g:pymode_options_fold = 0
let g:pymode_options_other = 0
let g:pymode_rope = 1
let g:pymode_rope_global_prefix = "<LocalLeader>R"
let g:pymode_rope_local_prefix = "<LocalLeader>r"
let g:pymode_rope_auto_project = 1
let g:pymode_rope_enable_autoimport = 0
let g:pymode_rope_autoimport_generate = 1
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 1
let g:pymode_rope_goto_def_newwin = 0
let g:pymode_rope_always_show_complete_menu = 0

" Set checking to passive as SyntasticCheck is called in lightline config
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" Personal settings
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5
let g:syntastic_ignore_files = ['\m^/usr/']
let g:syntastic_stl_format = '[%E{Err: %e}%B{, }%W{Warn: %w}]'

let g:tlWindowPosition=0

let g:ycm_confirm_extra_conf    = 0
let g:ycm_complete_in_comments  = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" let syntastic checkers work with ycm completion
let g:ycm_show_diagnostics_ui = 0
