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


# i3/Java fixup ----------------------------------------------------------
export _JAVA_AWT_WM_NONREPARENTING=1
# export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'
export JAVA_FONTS=/usr/share/fonts/truetype

# i3/libreoffice fixup ---------------------------------------------------
# export SAL_USE_VCLPLUGIN=gen lowriter
export SAL_USE_VCLPLUGIN=gtk3 lowriter
