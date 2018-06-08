set nohidden

set encoding=utf-8
set fileformat=unix

set modeline
set modelines=5
set backspace=indent,eol,start
set matchtime=3
set viminfo='20,\"100,:100,%,n~/.vim/viminfo
set shell=/bin/bash

" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

set clipboard=unnamed,unnamedplus

set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set shiftwidth=4
set shiftround
set autoindent
set smartindent cinwords=if,elif,elsif,elseif,else,for,foreach,do,while,until,try,catch,finally

set nowrap

set formatoptions=qrn1

set history=1000

set noswapfile
set nobackup

set undofile
set undoreload=10000
set undodir=~/.vim/tmp/undo//
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

set nospell
set complete+=kspell
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add

set ttyfast
set lazyredraw
set noshowmode
set showcmd
set visualbell
set noerrorbells
set ruler
set number
set numberwidth=5
set nolist
set listchars=tab:│\ ,eol:¬,extends:…,precedes:…
set showbreak=↪
set fillchars=diff:⣿,vert:│
set title
set laststatus=2
set splitright
set splitbelow
set synmaxcol=300
"set colorcolumn=+1
set signcolumn=yes

set wildmenu
set wildmode=list:full

set wildignore+=.git,.svn,.cvs,.hg               " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

"Add angle brackets to matchpairs
set matchpairs+=<:>

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
set nowrapscan

set scrolloff=5
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

" replace the default grep program with ag
" set grepprg=ag

set foldlevelstart=0

set completeopt=longest,menuone,preview

" If vim-fugitive is installed, the .git/tags path is automatically added
" but we include it here in case the plugin is not available
set tags=.git/tags;,./tags;,tags;

