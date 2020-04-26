#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Nick Morrott <knowledgejunkie@gmail.com>
#

# Update $fpath for additional zsh scripts/themes
fpath=( "$HOME/.zfunctions" $fpath )

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Options --------------------------------------------------------------------

# https://github.com/ohmyzsh/ohmyzsh/issues/449#issuecomment-6973326
setopt NO_NOMATCH # fix extendedglob clashing with git's ^

# Solarised dircolors  -------------------------------------------------------
if [[ -s "${ZDOTDIR:-$HOME}/.dircolors" ]]; then
    eval `dircolors "${ZDOTDIR:-$HOME}/.dircolors"`
fi

# zsh-autosuggestions
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
# ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

# Keybindings ----------------------------------------------------------------
bindkey \^U backward-kill-line

# Aliases --------------------------------------------------------------------
alias c="clear"
alias g="git"
alias q="quilt"

alias r="ranger"

alias t="tmux"
alias tls="tmux ls"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tns="tmux new-session -s"
alias tmi="tmuxinator"

alias v="vim"

alias fd="fdfind"
alias rg="rg --smart-case --hidden -g '!.git'"

alias collapse="sed -e 's/\s+/ /g'"
alias count="sort | uniq -c | sort -n"
alias cuts="cut -d' '"
alias grep="grep --color=auto"
alias vi="vim -u NONE -N"

alias cdgit="cd ~/dev/src/git/"
alias cdcvs="cd ~/dev/src/cvs/"

alias cddot="cd ~/.dotfiles/"

alias diffdir="git diff --no-index"

alias abcdef="abcde -c ~/.abcdef.conf"

# Debian ---------------------------------------------------------------------
alias cddeb="cd ~/dev/src/git/debian-packaging"
alias cdperl="cd ~/dev/src/git/debian-packaging/pkg-perl/packages"
alias cdpy="cd ~/dev/src/git/debian-packaging/pkg-python"
alias cdmm="cd ~/dev/src/git/debian-packaging/pkg-multimedia"
alias cdgo="cd ~/dev/src/git/debian-packaging/pkg-go"

# dpt helper script
. /usr/share/pkg-perl-tools/lib/posix-lib.sh

# History grep ---------------------------------------------------------------
hgrep () {
    history 0 | grep -P --color=always "$@" | grep -P --color=always -v "hgrep $@"
}

# tmux -----------------------------------------------------------------------
#
# Refresh SSH/DISPLAY vars for tmux (runs as zsh preexec hook) ---------------
#   Modified from https://babushk.in/posts/renew-environment-tmux.html
#
#   (See https://chrisdown.name/2013/08/02/fixing-stale-ssh-sockets-in-tmux.html
#   and https://blog.bennycornelissen.nl/dotfile-magic-terminal-multiplexers-and-ssh-agents/
#   for alternative approaches)
#
if [ -n "$TMUX" ]; then
  function refresh_tmux_vars {
    export $(tmux show-environment SSH_AUTH_SOCK)
    export $(tmux show-environment DISPLAY)
  }
else
  function refresh_tmux_vars { }
fi

# preexec hook (runs before every command) -----------------------------------
autoload -Uz  add-zsh-hook
add-zsh-hook preexec refresh_tmux_vars

# FZF-------------------------------------------------------------------------

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --hidden --follow --exclude=.git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude=.git . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable Software Flow Control (XON/XOFF flow control) ----------------------

# In terminals supporting this, C-s enables terminal scroll lock, and C-q
# disables it
stty -ixon

# Local Settings -------------------------------------------------------------
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
