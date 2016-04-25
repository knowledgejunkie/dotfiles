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


# xmonad/Java fixup ----------------------------------------------------------
export _JAVA_AWT_WM_NONREPARENTING=1

# xmonad/libreoffice fixup ---------------------------------------------------
export SAL_USE_VCLPLUGIN=gen lowriter
