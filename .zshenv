#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# PATH -----------------------------------------------------------------------
export PATH="$HOME/.bin:${PATH}"

# History --------------------------------------------------------------------
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=erasedups
export COMMAND_MODE=unix2003

# Editor ---------------------------------------------------------------------
export EDITOR='vim'
export VISUAL='vim'

# Less -----------------------------------------------------------------------
export PAGER='less'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export LESSCHARSET=UTF-8
export LESSOPEN="| /usr/bin/lesspipe %s 2>&-"

# Less termcap options:
#
# Style codes are:
#
# 0 – reset/normal
# 1 – bold
# 3 – italic/reversed
# 4 – underlined
# 5 – blink
#
# Foreground colour codes are:
#
# 30 – black
# 31 – red
# 32 – green
# 33 – orange
# 34 – blue
# 35 – magenta
# 36 – cyan
# 37 – white
#
# Background colour codes are:
#
# 40 – black
# 41 – red
# 42 – green
# 43 – orange
# 44 – blue
# 45 – magenta
# 46 – cyan
# 47 – white
#
export LESS_TERMCAP_mb=$(printf '\e[01;31m')    # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m')    # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m')        # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_so=$(printf '\e[01;30;43m') # enter standout mode - yellow
export LESS_TERMCAP_se=$(printf '\e[0m')        # leave standout mode
export LESS_TERMCAP_us=$(printf '\e[04;36m')    # enter underline mode - cyan
export LESS_TERMCAP_ue=$(printf '\e[0m')        # leave underline mode

# Pygmentize -----------------------------------------------------------------
export PYGMENTIZE_FORMATTER='terminal256'
export PYGMENTIZE_OPTS='style=monokai'

# i3/Java fixup --------------------------------------------------------------
export _JAVA_AWT_WM_NONREPARENTING=1
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/truetype

# i3/libreoffice fixup -------------------------------------------------------
# export SAL_USE_VCLPLUGIN=gen lowriter
export SAL_USE_VCLPLUGIN=gtk3 lowriter

# ranger ---------------------------------------------------------------------
export RANGER_LOAD_DEFAULT_RC=FALSE

# fzf/fd ---------------------------------------------------------------------
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude=.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fdfind --type d --hidden --follow --exclude=.git'
export FZF_COMPLETION_TRIGGER='##'

# gpodder --------------------------------------------------------------------
export GPODDER_HOME="$HOME/.gpodder"
export GPODDER_DOWNLOAD_DIR=/mnt/media_drive/media/podcasts/gpodder

# Debian ---------------------------------------------------------------------
export DEBFULLNAME='Nick Morrott'
export DEBEMAIL='nickm@debian.org'
