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
alias collapse="sed -e 's/\s+/ /g'"
alias count="sort | uniq -c | sort -n"
alias cuts="cut -d' '"
alias g="git"
alias grep="grep --color=auto"
alias v="vim"
alias vi="vim -u NONE -N"

alias cdgit="cd ~/dev/src/git/"
alias cdcvs="cd ~/dev/src/cvs/"
alias cdsvn="cd ~/dev/src/svn/"
alias cdhg="cd ~/dev/src/hg/"

# Environment variables ------------------------------------------------------
export PATH="$HOME/bin:${PATH}"

export EDITOR='vim'
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=erasedups
export COMMAND_MODE=unix2003

# xmonad/Java fixup ----------------------------------------------------------
export _JAVA_AWT_WM_NONREPARENTING=1

# Vim... ---------------------------------------------------------------------

# Restore Ctrl-r history search in vim mode
#   http://zshwiki.org/home/zle/bindkeys
# bindkey -M viins '^r' history-incremental-search-backward
# bindkey -M vicmd '^r' history-incremental-search-backward

# bindkey -a 'gg' beginning-of-buffer-or-history
# bindkey -a u undo
# bindkey -a '^R' redo

# History grep ---------------------------------------------------------------

hgrep () { 
    history 0 | grep -P --color=always "$@" | grep -P --color=always -v "hgrep $@"
}

# Local Settings -------------------------------------------------------------
if [[ -s $HOME/.zshrc_local ]] ; then source $HOME/.zshrc_local ; fi
