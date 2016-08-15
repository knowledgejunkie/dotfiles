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

# Solarised dircolors  -------------------------------------------------------
if [[ -s "${ZDOTDIR:-$HOME}/.dircolors" ]]; then
    eval `dircolors "${ZDOTDIR:-$HOME}/.dircolors"`
fi

# Useful aliases -------------------------------------------------------------
alias c="clear"
alias g="git"
alias q="quilt"

alias t="tmux"
alias tls="tmux ls"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tns="tmux new-session -s"
alias tmi="tmuxinator"

alias v="vim"

alias collapse="sed -e 's/\s+/ /g'"
alias count="sort | uniq -c | sort -n"
alias cuts="cut -d' '"
alias grep="grep --color=auto"
alias vi="vim -u NONE -N"

alias cdgit="cd ~/dev/src/git/"
alias cdcvs="cd ~/dev/src/cvs/"
alias cdsvn="cd ~/dev/src/svn/"
alias cdhg="cd ~/dev/src/hg/"

alias cddot="cd ~/.dotfiles/"

# Environment variables ------------------------------------------------------
export PATH="$HOME/.bin:${PATH}"

export EDITOR='vim'
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=erasedups
export COMMAND_MODE=unix2003
export LESSCHARSET=UTF-8

# Debian ---------------------------------------------------------------------
export DEBFULLNAME='Nick Morrott'
export DEBEMAIL='knowledgejunkie@gmail.com'

alias cddeb="cd ~/dev/src/git/debian-packaging"
alias cdpkg="cd ~/dev/src/git/debian-packaging/pkg-perl/packages"

# History grep ---------------------------------------------------------------
hgrep () {
    history 0 | grep -P --color=always "$@" | grep -P --color=always -v "hgrep $@"
}

# Local Settings -------------------------------------------------------------
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
