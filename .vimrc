" Credits ----------------------------------------------------------------- {{{
"
" Maintainer:
" Nick Morrott <knowledgejunkie@gmail.com>
"   https://github.com/knowledgejunkie/dotfiles/blob/master/vim/vimrc
"
" (originally based on Steve Losh's comprehensive vimrc file)
"   https://github.com/sjl/dotfiles/blob/master/vim/vimrc
"
" Additional snippets referenced where possible.
"
" }}}
" Hints and tips ---------------------------------------------------------- {{{
"
" Display ordering of loaded Vimscripts
" :scriptnames
"
" Display current settings
" :verbose set
"
" Debug particular settings (e.g. cindent)
" :verbose set cindent?
"
" Display default vim keybindings
" :help index
"
" Display current key mappings
" :verbose map
" :verbose map!
"
" Display current key mapping for particular key (e.g. <Leader>)
" :verbose map <Leader>
"
" Display current highlighting settings:
" :hi
"
" Display available colours in vim
" http://vim.wikia.com/wiki/VimTip634
"
" Write out a file via sudo
" :w !sudo tee %
"
" Use vim as a hex editor
" :%!xxd
" :%!xxd -r
"
" Capture standard output of external command to buffer
" :read !{cmd}
"
" Pass buffer as standard input to external command
" :write !{cmd}
"
" Execute Perl/Ruby one-liners (if support compiled in) over file or selection
" :perldo ...
" :rubydo ...
"
" Execute an Ex command for all buffers listed in :ls
" :bufdo {cmd}
"
" Execute an Ex command for all arguments listed in :args
" :argdo {cmd}
"
" To retab a buffer when changing tab settings (e.g. set noexpandtab)
" :retab
"
" }}}
" Function Key Quicklist -------------------------------------------------- {{{
"
" A quicklist of F-key bindings userd elsewhere in this file
"
" <F1>
" <F2>  NERDTreeTabs toggle
" <F3>  GitGutter toggle
" <F4>  Run current file
" <F5>  Gundo toggle
" <F6>  Numbering toggle
" <F7>  Show syntax stack
" <F8>  Show highlight groups
" <F9>
" <F10> Tagbar toggle
" <F11> Mouse toggle
" <F12> Paste toggle
"
" }}}
" Plugin Management ------------------------------------------------------- {{{
"
" Configure vim-plug to manage plugins
"   https://github.com/junegunn/vim-plug
"
" Make sure you use single quotes
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/vim-easy-align'
"
" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using git URL
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }
"
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
"
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
" Plug 'scrooloose/nerdcommenter'

Plug 'mileszs/ack.vim'
Plug 'bling/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'docunext/closetag.vim'
Plug 'ap/vim-css-color'
" Plug 'chrisbra/csv.vim'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
" Plug 'dansomething/vim-eclim'
" Plug 'ervandew/eclim'
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'
Plug 'junegunn/goyo.vim'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'elzr/vim-json'
Plug 'junegunn/limelight.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'myusuf3/numbers.vim'
" Plug 'edkolev/promptline.vim'
Plug 'duff/vim-scratch'
Plug 'rstacruz/sparkup'
" Plug 'millermedeiros/vim-statline'
Plug 'godlygeek/tabular'
" Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang --system-boost' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'knowledgejunkie/vim-xmltvfixup'

Plug 'knowledgejunkie/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
" Plug 'godlygeek/csapprox'

call plug#end()

" To update plugins from inside Vim:
"   :PlugUpdate
"
" To update plugins from command line:
"   $ vim +PlugUpdate +qall now

"}}}
" Vim startup ------------------------------------------------------------- {{{
"
" Open NERDTree if no files were given on command line
"   http://blogs.perl.org/users/ovid/2011/04/nerdtree-on-startup.html

" function! VimStartUp() " {{{
"     if 0 == argc()
"         NERDTreeTabsToggle
"     end
" endfunction " }}}

" autocmd! VimEnter * call VimStartUp()

" }}}
" Basic options ----------------------------------------------------------- {{{
"   Leader/LocalLeader {{{

let mapleader = ","
let maplocalleader = "_"

"   }}}
"   Basic editor behaviour {{{

set encoding=utf-8
set fileformat=unix
set modelines=0
set backspace=indent,eol,start
set matchtime=3
set viminfo='20,\"100,:100,%,n~/.vim/viminfo
set shell=/bin/bash

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

set hidden

" Save when losing focus
au FocusLost * :silent! wall

" jj to quickly exit Insert mode
inoremap jj <Esc>

" prevent switch to Replace mode if <Insert> pressed in Insert mode
inoremap <Insert> <Nop>

" Making it so ; works like : for commands. Saves typing and eliminates :W
" style typos due to lazy holding shift
" FIXME: shadows normal ; functionality
" nnoremap ; :

"   }}}
"   Tabs/spaces/wrapping {{{

set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set shiftwidth=4
set shiftround
set autoindent
set nowrap

set formatoptions=qrn1

"   }}}
"   History/undo/backups {{{
"     Probably want to add these to .gitignore if sharing dotfiles

set history=1000

set noswapfile                    " disable swapfile

set undofile
set undoreload=10000
set undodir=~/.vim/tmp/undo//     " undo files
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

set backup                        " enable backups
set backupdir=~/.vim/tmp/backup// " backups
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*
"   }}}
"   Dictionary/spelling {{{

set nospell
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add

" shortcut to toggle spelling
nnoremap <Leader>s :setlocal spell! spelllang=en_gb<CR>

"   }}}
"   Editor decoration {{{

set ttyfast
set lazyredraw
set showmode
set showcmd
set visualbell
set noerrorbells
set ruler
set number
set numberwidth=5
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set fillchars=diff:⣿,vert:│
set title
set laststatus=2
set splitbelow
set splitright
set synmaxcol=800
"set colorcolumn=+1

" Resize splits when the window is resized
au VimResized * :wincmd =

"   }}}
"   Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.

" augroup trailing
"     au!
"     au InsertEnter * :set listchars-=trail:˽
"     au InsertLeave * :set listchars+=trail:˽
" augroup END

" Clean trailing whitespace
" function! TrimWhiteSpace()
"     %s/\s\+$//e
" endfunction

" nnoremap <silent> <LocalLeader>w mz:call TrimWhiteSpace()<CR>'z

" Remove trailing whitespace on save
" autocmd FileType perl,python,java autocmd FileWritePre    * :call TrimWhiteSpace()
" autocmd FileType perl,python,java autocmd FileAppendPre   * :call TrimWhiteSpace()
" autocmd FileType perl,python,java autocmd FilterWritePre  * :call TrimWhiteSpace()
" autocmd FileType perl,python,java autocmd BufWritePre     * :call TrimWhiteSpace()

"   }}}
"   Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au BufRead,BufNewFile * set cursorline
    au WinEnter * set cursorline
    au WinLeave * set nocursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END

"   }}}
"   Wildmenu completion {{{

set wildmenu
set wildmode=list:full

set wildignore+=.git,.svn,.cvs,.hg               " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


"   }}}
"   Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"   }}}
"   Matching brackets/pairs {{{

"Add angle brackets to matchpairs
set matchpairs+=<:>

"   }}}
" }}}
" Colorscheme and custom highlighting ------------------------------------- {{{
"   Color scheme {{{

syntax on
set background=dark

" https://github.com/nanotech/jellybeans.vim.git
" colorscheme jellybeans

" https://github.com/altercation/vim-colors-solarized
"let g:solarized_termcolors=256
colorscheme solarized

"   }}}
"   Custom highlighting {{{

" Highlight VCS conflict markers
match ErrorMsg /^\(<\|=\|>\)\{7\}\([^=].\+\)\?$/

"   }}}
"   Cursor colour {{{
" Make cursor more obvious
au InsertLeave * hi Cursor guibg=red
au InsertEnter * hi Cursor guibg=green

" http://vim.wikia.com/wiki/Configuring_the_cursor
if &term =~ "xterm\\|rxvt"
  " use a green cursor in insert mode
  let &t_SI = "\<Esc>]12;green\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  " au VimLeave * silent !echo -ne "\033]112\007"
  au VimLeave * silent !echo -ne "\033]12;gray\007"
endif
"   }}}
"   Alternate line highlighting {{{
"     http://stackoverflow.com/a/219693

" Highlight every other line (may need to update match string if
" using very-magic matching)
map <Leader>ho :set hls<CR>/\n.*\n/<CR>
"   }}}
" }}}
" Convenience mappings ---------------------------------------------------- {{{
"   Selecting text {{{

"   Select (charwise) the contents of the current line, excluding indentation.
"   Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

"   Easier linewise reselection
nnoremap <Leader>V V`]

"   Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV
"   }}}
"   Moving text {{{

"     Visual shifting (does not exit Visual mode)
"       https://github.com/spf13/spf13-vim/blob/master/.vimrc
vnoremap < <gv
vnoremap > >gv
"
"     Shifting whole lines up/down
"       https://github.com/pera/vim/blob/master/.vimrc
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>
inoremap <C-Up> <Esc>:m-2<CR>
vnoremap <C-Down> :m'>+<CR>gv
vnoremap <C-Up> :m-2<CR>gv
"   }}}
"   Copying/pasting text {{{

set pastetoggle=<F12>

" X primary
noremap <Leader>y "*y
noremap <Leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <Leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" X clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP
"   }}}
"   Sorting text {{{

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>
"   }}}
"   Linewise consistency mappings {{{
 
" Yank from the cursor to the end of the line
nnoremap Y y$

" Make D behave
nnoremap D d$
" 
" Easier to type if you don't use the default behaviour.
noremap H ^
noremap L $
vnoremap L g_
"   }}}
"   Buffer/window/tab handling {{{
"     Snippets from http://stackoverflow.com/a/1639333

" Create new tab
nnoremap <C-t> :tabnew<CR>

" Moving in tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Quick vsplit
noremap <Leader>v <C-w>v

" Meta-key fixups to handle terminals that send Escape sequences
set <M-h>=h
set <M-j>=j
set <M-k>=k
set <M-l>=l
set <M-s>=s
set <M-v>=v

" Maps Meta-[h,j,k,l] to resizing a window split
map <silent> <M-h> <C-w><
map <silent> <M-j> <C-W>-
map <silent> <M-k> <C-W>+
map <silent> <M-l> <C-w>>

" Maps Meta-[s.v] to horizontal and vertical split respectively
map <silent> <M-s> :split<CR>
map <silent> <M-v> :vsplit<CR>
"   }}}
"   Quick vimrc editing {{{

nnoremap <Leader>ev :edit $MYVIMRC<cr>
"   }}}
"   Mouse Toggle (Vim/terminal) {{{
"     http://nvie.com/posts/how-i-boosted-my-vim/

function! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

nnoremap <F11> :call ToggleMouse()<CR>
"   }}}
"   Registers {{{

" show the registers from things cut/yanked
nnoremap <Leader>r :registers<CR>

" map the various registers to a leader shortcut for pasting from them
" nnoremap <Leader>0 "0p
" nnoremap <Leader>1 "1p
" nnoremap <Leader>2 "2p
" nnoremap <Leader>3 "3p
" nnoremap <Leader>4 "4p
" nnoremap <Leader>5 "5p
" nnoremap <Leader>6 "6p
" nnoremap <Leader>7 "7p
" nnoremap <Leader>8 "8p
" nnoremap <Leader>9 "9p
"   }}}
"   Compile/run file {{{

" Run Make for current file
map <silent> <Leader>m :make<CR>:cw<CR>

" Execute current file
map <F4> <Esc>:w<CR>:!%:p<CR>
"    }}}
"   Easy filetype switching {{{

nnoremap _md :set ft=markdown<CR>
nnoremap _js :set ft=javascript<CR>
nnoremap _d  :set ft=diff<CR>
nnoremap _pl :set ft=perl<CR>
"   }}}
"   Insert Mode Completion {{{

inoremap <C-f> <C-x><C-f>
inoremap <C-]> <C-x><C-]>
"   }}}
"   Command Mode History {{{

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"   }}}
"   Uncategorised {{{

" Highlight Group(s)
nnoremap <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                        \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                        \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" "Uppercase current word
"
" This mapping allows you to press <C-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <C-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <C-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za
nnoremap <C-u> gUiw

" Unfuck my screen
nnoremap <Leader>u :syntax sync fromstart<cr>:redraw!<cr>

" I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
" From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
vnoremap u <nop>
vnoremap gu u

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Diffoff
nnoremap <Leader>D :diffoff!<cr>

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Source
vnoremap <Leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <Leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Marks and Quotes
"noremap ' `
"noremap æ '
"noremap ` <C-^>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" I suck at typing.
nnoremap <LocalLeader>= ==
vnoremap - =

" Toggle [i]nvisible characters
nnoremap <Leader>i :set list!<cr>

" Has to be an autocommand because repeat.vim eats the mapping otherwise :(
au VimEnter * :nnoremap U <C-r>
"   }}}
" }}}
" Searching and movement -------------------------------------------------- {{{
"
" Remap comma (used as <Leader>) to preserve reverse char search
noremap \ ,

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=5
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

noremap <silent> <Leader><space> :noh<cr>:call clearmatches()<cr>

augroup togglehlsearch
    au!
    au InsertEnter * :set nohlsearch
    au InsertLeave * :set hlsearch
augroup END

" Avoid Caps Lock errors
nnoremap ZZ zz

" Don't move on *
nnoremap * *<C-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Toggle "keep current line in the center of the screen" mode
nnoremap <Leader>C :let &scrolloff=999-&scrolloff<cr>

" replace the default grep program with ack
set grepprg=ack

" Open a Quickfix window for the last search.
nnoremap <silent> <Leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <Leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Visual star search (updated version from Practical Vim)
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" gi already moves to "last place you exited insert mode", so we'll map gI to
" something similar: move to last change
nnoremap gI `.

" Include flags when repeating last substition
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" }}}
" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <Leader>z mzzMzvzz15<C-e>`z:Pulse<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    "Note: need to fixup overall line width to take into account:
    " - extra spacing used by Syntastic, or disable signs in Syntastic config
    " - apparent different in handling of relativenumber vs number
    " - fact that placement at end of line is different if numbering off
    let nucolwidth = &fdc + &number * &numberwidth + &relativenumber * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Omnicompletion ---------------------------------------------------------- {{{
"   http://stackoverflow.com/a/7101219

set completeopt=longest,menuone,preview

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css,less set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType mako set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" }}}
" Filetype-specific ------------------------------------------------------- {{{
"   C {{{

" Hints from the Python coding standards at:
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
    au BufRead,BufNewFile *.c,*.h setlocal tabstop=8
    au BufRead,BufNewFile *.c,*.h setlocal textwidth=79

    function! Select_c_style()
        if search('^\t', 'n', 150)
            setlocal shiftwidth=8
            setlocal noexpandtab
        elsif
            setlocal shiftwidth=4
            setlocal expandtab
        endif
    endfunction
    au BufRead,BufNewFile *.c,*.h call Select_c_style()

    au BufRead,BufNewFile *.c,*.h setlocal formatoptions-=c formatoptions-=o formatoptions-=r

    " abbreviations for c programming
    " http://stackoverflow.com/a/789284
    function! LoadCAbbrevs()
        iabbr do do {<CR>} while ();<C-O>3h<C-O>
        iabbr for for (;;) {<CR>}<C-O>k<C-O>3l<C-O>
        iabbr switch switch () {<CR>}<C-O>k<C-O>6l<C-O>
        iabbr while while () {<CR>}<C-O>k<C-O>5l<C-O>
        iabbr if if () {<CR>}<C-O>k<C-O>2l<C-O>
        iabbr #d #define
        iabbr #i #include
    endfunction
    au FileType c,cpp call LoadCAbbrevs()
augroup END
"   }}}
"   CSS and LessCSS {{{

augroup ft_css
    au!
    au BufNewFile,BufRead *.less setlocal filetype=less
    au BufNewFile,BufRead *.sass set filetype=css

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal iskeyword+=-

    " Use <LocalLeader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <LocalLeader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END
"   }}}
"   Helpfiles {{{

augroup ft_help
    au!
    au FileType help setlocal textwidth=78
    au FileType help wincmd L
augroup END
"   }}}
"   HTML {{{

augroup ft_html
    au!
    au BufNewFile,BufRead *.html setlocal filetype=html
    au FileType html setlocal foldmethod=manual

    " Use <LocalLeader>f to fold the current tag.
    au FileType html nnoremap <buffer> <LocalLeader>f Vatzf

    " Use <LocalLeader>t to fold the current templatetag.
    au FileType html nmap <buffer> <LocalLeader>t viikojozf

    " Indent tag
    au FileType html nnoremap <buffer> <LocalLeader>= Vat=
augroup END
"   }}}
"   Java {{{

augroup ft_java
    au!
    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END
"   }}}
"   Javascript {{{

let g:javaScript_fold=1

augroup ft_javascript
    au!
    "au FileType javascript setlocal foldmethod=marker
    "au FileType javascript setlocal foldmarker={,}

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END
"   }}}
"   JSON {{{

augroup ft_json
    autocmd!
    autocmd FileType json setlocal autoindent
    autocmd FileType json setlocal formatoptions=tcq2l
    autocmd FileType json setlocal textwidth=78 shiftwidth=2
    autocmd FileType json setlocal softtabstop=2 tabstop=8
    autocmd FileType json setlocal expandtab
    autocmd FileType json setlocal foldmethod=syntax

    " tidy/pretty-print via json_pp
    nnoremap <Leader>jt :%!json_pp<cr>
    vnoremap <Leader>jt :!json_pp<cr>
augroup END
"   }}}
"   Makefiles {{{

" from http://colinnewell.wordpress.com/2007/05/07/vim-settings-for-whitespace/
augroup ft_makefile
    au!
    autocmd FileType make setlocal noexpandtab shiftwidth=8
    autocmd BufRead,BufNewFile Makefile setlocal noexpandtab shiftwidth=8
augroup END
"   }}}
"   Markdown {{{

augroup ft_markdown
    au!
    au BufNewFile,BufRead *.m*down setlocal filetype=markdown

    " Use <LocalLeader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <LocalLeader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <LocalLeader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <LocalLeader>3 I### <ESC>
augroup END
"   }}}
"   OrgMode {{{

augroup ft_org
    au!
    au Filetype org nmap <buffer> Q vahjgq
    au Filetype org setlocal nolist
augroup END
"   }}}
"   Perl {{{

let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:perl_include_pod = 1
let g:perl_extended_vars = 1

augroup ft_perl
    au!
    au BufNewFile,BufRead *.pl,*.pm,*.t,*.in set filetype=perl
    au FileType perl match ErrorMsg /^\t\+\|\s\+$/
    "au FileType perl setlocal foldmethod=syntax

" Perltidy support
" http://publius-ovidius.livejournal.com/242806.html
nnoremap  <Leader>pt :%!perltidy -q<cr>
vnoremap <Leader>pt :!perltidy -q<cr>

" Perldoc support
" http://publius-ovidius.livejournal.com/242806.html
nnoremap <Leader>pd :!perldoc %<cr>

augroup END
"   }}}
"   PHP {{{

let g:php_folding=1

augroup ft_php
    au!
    "au Filetype php setlocal foldmethod=syntax
    au FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
augroup END
"   }}}
"   Python {{{

" Hints from the Python coding standards at:
" http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc

augroup ft_python
    au!
    au FileType python setlocal foldmethod=indent
    let python_highlight_all=1
    au BufRead,BufNewFile *.py,*.pyw setlocal tabstop=8
    au BufRead,BufNewFile *.py,*.pyw setlocal textwidth=79
    au BufRead,BufNewFile *.py,*.pyw setlocal shiftwidth=4
    au BufRead,BufNewFile *.py,*.pyw setlocal expandtab
    au BufRead,BufNewFile *.py,*.pyw match ErrorMsg /^\t\+\|\s\+$/
augroup END
"   }}}
"   QuickFix {{{

augroup ft_quickfix
    au!
    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap tw=0
augroup END
"   }}}
"   Ruby {{{

let g:ruby_fold=1

augroup ft_ruby
    au!
    au Filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END
"   }}}
"   Shell {{{

let g:sh_fold_enabled=1

augroup ft_shell
    au!
    au FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
augroup END
"   }}}
"   Vim {{{

augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    " Automatically source the .vimrc file whenver it is saved
    " FIXME for some reason I need to force the filetype once the file is
    " resourced otherwise folding is broken
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc source $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif | setlocal filetype=vim
augroup END
"   }}}
"   XML {{{

let g:xml_syntax_folding=1

augroup ft_xml
    au!
    "au FileType xml setlocal foldmethod=syntax
    au FileType xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

    " tidy/pretty-print via xml_pp
    nnoremap <Leader>xt :%!xml_pp<cr>
    vnoremap <Leader>xt :!xml_pp<cr>
augroup END
"   }}}
"   XMLTV Fixups {{{
augroup ft_xmltvfixup
    au!
    au BufNewFile,BufRead prog_titles_to_process set filetype=xmltvfixup
augroup END
"   }}}
"   XSLT {{{

augroup ft_xslt
    au!
    au Filetype xslt setlocal foldmethod=syntax
    au FileType xslt setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END
"   }}}
" }}}
" Text objects ------------------------------------------------------------ {{{
"   Shortcut for [] {{{
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[
"   }}}
"   Next and Last {{{

" Motion for "next/last object". For example, "din(" would go to the next "()"
" pair and delete its contents.

onoremap an :<C-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<C-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<C-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<C-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<C-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<C-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<C-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<C-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "r"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
"   }}}
"   Numbers {{{
" Motion for numbers.  Great for CSS.  Lets you do things like this:
"
" margin-top: 200px; -> daN -> margin-top: px;
"              ^                          ^
" TODO: Handle floats.

onoremap N :<C-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<C-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<C-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<C-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<C-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<C-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction
"   }}}
" }}}
" Abbreviations ----------------------------------------------------------- {{{

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('gh/', 'http://github.com/knowledgejunkie/')

iabbrev kjat knowledgejunkie@gmail.com

" }}}
" Plugin settings --------------------------------------------------------- {{{
"   Ack {{{
"     https://github.com/mileszs/ack.vim

let g:ackprg="ack -H --nocolor --nogroup --column"
nnoremap <Leader>a :Ack!<space>

"   }}}
"   Airline {{{
"     https://github.com/bling/vim-airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"   }}}
"   Ctrl-P {{{
"     https://github.com/kien/ctrlp.vim

let g:ctrlp_map = '<Leader>f'

"let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag']

let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<C-j>', '<down>'],
\ 'PrtSelectMove("k")':   ['<C-k>', '<up>'],
\ 'PrtHistory(-1)':       ['<C-n>'],
\ 'PrtHistory(1)':        ['<C-p>'],
\ 'ToggleFocus()':        ['<C-tab>'],
\ }

let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|lib/|classes/|libs/|deploy/vendor/|.git/|.hg/|.svn/|.*migrations/" .
    \ ")'"

let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files | " .
    \ ctrlp_filter_greps

let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]

nnoremap <Leader>. :CtrlPTag<cr>

"   }}}
"   DelimitMate {{{
"     https://github.com/Raimondi/delimitMate

" Off by default as it can slow things down A LOT in large scripts
" To turn it on, use :DelimitMateSwitch in a buffer
let delimitMate_offByDefault = 1

"   }}}
"   Fugitive {{{
"     https://github.com/tpope/vim-fugitive

nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gci :Gcommit<cr>
nnoremap <Leader>gw :Gwrite<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gb :Gblame<cr>

" FIXME - sync with .gitconfig
nnoremap <Leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

" FIXME
"   add %{fugitive#statusline()} to statusline
"   }}}
"   Gundo {{{
"     https://github.com/sjl/gundo.vim

nnoremap <F5> :GundoToggle<CR>
inoremap <F5> <esc>:GundoToggle<CR>

let g:gundo_debug = 1
let g:gundo_preview_bottom = 1
let g:gundo_tree_statusline = "Gundo"
let g:gundo_preview_statusline = "Gundo Preview"

"   }}}
"   GitGutter {{{
"     https://github.com/airblade/vim-gitgutter

" Set the sign column background to black (update jellybeans colorscheme)
" exec "hi SignColumn ctermbg=".g:jellybeans_background_color_256

let g:gitgutter_sign_column_always=1

noremap  <F3> :GitGutterToggle<cr>
inoremap <F3> <esc>:GitGutterToggle<cr>
"   }}}
"   NERDCommenter (disabled) {{{
"     http://github.com/scrooloose/nerdcommenter
"
"   Using defaults e.g. <Leader>c<Space> and <Leader>cc
"   }}}
"   NERDTree {{{
"     http://github.com/scrooloose/nerdtree

"noremap  <F2> :NERDTreeToggle<cr>
"inoremap <F2> <esc>:NERDTreeToggle<cr>

augroup ps_nerdtree
    au!

    au Filetype nerdtree setlocal nolist
    " au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\~$', '.*\.pyc$', '.*\.o$', 'db.db']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'

"   }}}
"   NERDTreeTabs {{{
"     https://github.com/jistr/vim-nerdtree-tabs
"
nnoremap <F2> :NERDTreeTabsToggle<cr>
inoremap <F2> <esc>:NERDTreeTabsToggle<cr>

"   }}}
"   Numbers {{{
"     https://github.com/myusuf3/numbers.vim.git

nnoremap <F6> :NumbersToggle<CR>
inoremap <F6> <esc>:NumbersToggle<CR>

"   }}}
"   Python-Mode (disabled) {{{
"     https://github.com/klen/python-mode

"let g:pymode_doc = 1
"let g:pymode_doc_key = '<LocalLeader>ds'
"let g:pydoc = 'pydoc'
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 0
"let g:pymode_syntax_builtin_objs = 1
"let g:pymode_syntax_print_as_function = 0
"let g:pymode_syntax_space_errors = 0
"let g:pymode_run = 0
"let g:pymode_lint = 0
"let g:pymode_breakpoint = 0
"let g:pymode_utils_whitespaces = 0
"let g:pymode_virtualenv = 0
"let g:pymode_folding = 0

"let g:pymode_options_indent = 0
"let g:pymode_options_fold = 0
"let g:pymode_options_other = 0

"let g:pymode_rope = 1
"let g:pymode_rope_global_prefix = "<LocalLeader>R"
"let g:pymode_rope_local_prefix = "<LocalLeader>r"
"let g:pymode_rope_auto_project = 1
"let g:pymode_rope_enable_autoimport = 0
"let g:pymode_rope_autoimport_generate = 1
"let g:pymode_rope_autoimport_underlineds = 0
"let g:pymode_rope_codeassist_maxfixes = 10
"let g:pymode_rope_sorted_completions = 1
"let g:pymode_rope_extended_complete = 1
"let g:pymode_rope_autoimport_modules = ["os", "shutil", "datetime"]
"let g:pymode_rope_confirm_saving = 1
"let g:pymode_rope_vim_completion = 1
"let g:pymode_rope_guess_project = 1
"let g:pymode_rope_goto_def_newwin = 0
"let g:pymode_rope_always_show_complete_menu = 0

"   }}}
"   Scratch {{{
"     https://github.com/duff/vim-scratch

command! ScratchToggle call ScratchToggle()

function! ScratchToggle()
    if exists("w:is_scratch_window")
        unlet w:is_scratch_window
        exec "q"
    else
        exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
        let w:is_scratch_window = 1
    endif
endfunction

nnoremap <silent> <Leader><tab> :ScratchToggle<cr>

"   }}}
"   Sparkup (disabled) {{{
"     https://github.com/rstacruz/sparkup (general)
"     https://github.com/tristen/vim-sparkup (vim-specific)

"let g:sparkupNextMapping = '<C-s>'

"  }}}
"   Statline {{{
"     https://github.com/millermedeiros/vim-statline
"
let g:statline_filename_relative = 1
" let g:statline_show_charcode = 1

"   }}}
"   Surround {{{
"     https://github.com/tpope/vim-surround
"
"   Using defaults
"   }}}
"   Syntastic {{{
"     https://github.com/scrooloose/syntastic

" Recommended settings for plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Personal settings
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_auto_jump = 3
let g:syntastic_loc_list_height = 5
let g:syntastic_ignore_files = ['\m^/usr/']
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'

"   }}}
"   Tabular {{{
"   https://github.com/godlygeek/tabular
"   https://github.com/emilyst/home

nnoremap  <LocalLeader>aa        :Tabularize  argument_list<CR>
vnoremap  <LocalLeader>aa        :Tabularize  argument_list<CR>

nnoremap  <LocalLeader>a<Space> :Tabularize  / /<CR>
vnoremap  <LocalLeader>a<Space> :Tabularize  / /<CR>

nnoremap  <LocalLeader>a&       :Tabularize  /&<CR>
vnoremap  <LocalLeader>a&       :Tabularize  /&<CR>

nnoremap  <LocalLeader>a=       :Tabularize  /=<CR>
vnoremap  <LocalLeader>a=       :Tabularize  /=<CR>

nnoremap  <LocalLeader>a:       :Tabularize  /:<CR>
vnoremap  <LocalLeader>a:       :Tabularize  /:<CR>

nnoremap  <LocalLeader>a::      :Tabularize  /:\zs<CR>
vnoremap  <LocalLeader>a::      :Tabularize  /:\zs<CR>

nnoremap  <LocalLeader>a,       :Tabularize  /,<CR>
vnoremap  <LocalLeader>a,       :Tabularize  /,<CR>

nnoremap  <LocalLeader>a,,      :Tabularize  /,\zs<CR>
vnoremap  <LocalLeader>a,,      :Tabularize  /,\zs<CR>

nnoremap  <LocalLeader>a<Bar>   :Tabularize  /<Bar><CR>
vnoremap  <LocalLeader>a<Bar>   :Tabularize  /<Bar><CR>

"   }}}
"   Tagbar {{{
"   https://github.com/majutsushi/tagbar

nnoremap <F10> :TagbarToggle<CR>

"   }}}
"   UltiSnips {{{
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<C-Space>"
let g:UltiSnipsJumpBackwardTrigger="<S-C-Space>"
let g:UltiSnipsEditSplit="vertical"
"
"     https://github.com/honza/vim-snippets
"   }}}
"   Unimpaired {{{
"     https://github.com/tpope/vim-unimpaired
"   }}}
"   YouCompleteMe {{{
let g:ycm_confirm_extra_conf    = 0
let g:ycm_complete_in_comments  = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1
"   }}}
" }}}
" Mini-plugins ------------------------------------------------------------ {{{
"   Ack motions {{{

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.

nnoremap <silent> <Leader>A :set opfunc=<SID>AckMotion<CR>g@
xnoremap <silent> <Leader>A :<C-U>call <SID>AckMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AckMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

"   }}}
"   Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
"
"     Function {{{
function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction
"     }}}
"     Mappings {{{
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
"     }}}
"     Default Highlights {{{
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
"     }}}
"   }}}
"   Pulse Line {{{

function! s:Pulse() " {{{
    let current_window = winnr()
    windo set nocursorline
    execute current_window . 'wincmd w'
    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 9
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

"   }}}
"   Synstack {{{

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
    echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>

"   }}}
"   Tasklist (currently unmapped) {{{
"     http://juan.boxfi.com/vim-plugins/#comment-28

let s:tasklist_open = 0
function! s:ToggleTaskList()
    if (s:tasklist_open == 1)
        call s:Exit(0)
        let s:tasklist_open = 0
    else
        call s:TaskList()
        let s:tasklist_open = 1
    endif
endfunction

command! ToggleTaskList call s:ToggleTaskList()

" FIXME
" Perhaps map this to an unbound F-key
"map :ToggleTaskList

"   }}}
" }}}
" Environments (GUI/terminal) --------------------------------------------- {{{

if has('gui_running')
    " GUI Vim

    " Remove all the UI cruft
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R

    highlight SpellBad term=underline gui=undercurl guisp=Orange
else
    " Console Vim
    " assume 256 color terminal like rxvt-unicode-256color
    set t_Co=256
    " Mouse support
    set mouse=a
    set ttymouse=xterm2
endif

" }}}
" Local machine-specific .vimrc ------------------------------------------- {{{

" From http://blog.sanctum.geek.nz/local-vimrc-files/
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" }}}
