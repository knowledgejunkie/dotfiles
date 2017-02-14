" Leader/LocalLeader------------------------------------------------------ {{{1

let mapleader = ","
let maplocalleader = ","

" Plugin Management ------------------------------------------------------ {{{1
call plug#begin('~/.vim/plugged')

" Enabled {{{2
Plug 'knowledgejunkie/vim-colors-solarized'

Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vinegar'
" Disabled for patched version: see
" https://github.com/tpope/vim-vinegar/issues/65
" https://github.com/tpope/vim-vinegar/issues/74
Plug 'manasthakur/vim-vinegar'

Plug 'scrooloose/syntastic'

Plug 'rking/ag.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'vim-scripts/BufOnly.vim'
Plug 'docunext/closetag.vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'knowledgejunkie/deb.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'duggiefresh/vim-easydir'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'elzr/vim-json'
Plug 'tommcdo/vim-lion'
Plug 'jwhitley/vim-matchit'
Plug 'Valloric/MatchTagAlways'
Plug 'myusuf3/numbers.vim'
Plug 'sickill/vim-pasta'
Plug 'mannih/vim-perl-variable-highlighter'
Plug 'klen/python-mode'
Plug 'airblade/vim-rooter'
Plug 'duff/vim-scratch'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'majutsushi/tagbar'
Plug 'jontrainor/TaskList.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --system-boost' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'knowledgejunkie/vim-xmltvfixup'
Plug 'knowledgejunkie/vim-xmltvconfig'

Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

" Disabled {{{2
" Plug 'nanotech/jellybeans.vim'
"
" Plug 'chrisbra/csv.vim'
" Plug 'junegunn/vim-easy-align'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'edkolev/promptline.vim'
" Plug 'tpope/vim-sensible'
" Plug 'mhinz/vim-signify'
" Plug 'rstacruz/sparkup'
" }}}

call plug#end()

" Color scheme ----------------------------------------------------------- {{{1

syntax on
colorscheme solarized
set background=dark

" Machine-specific .vimrc overrides -------------------------------------- {{{1

" Allow per-machine overrides in ~/.vim/host/hostname and
" ~/.vimrc.local.

" ~/.vim/host/hostname {{{2
let s:hostfile = $HOME . '/.vim/host/' . substitute(hostname(), "\\..*", '', '')
if filereadable(s:hostfile)
    execute 'source ' . s:hostfile
endif

" ~/.vimrc.local {{{2
let s:vimrc_local = $HOME . '/.vimrc.local'
if filereadable(s:vimrc_local)
    execute 'source ' . s:vimrc_local
endif

