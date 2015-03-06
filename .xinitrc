#!/usr/bin/env bash 

# http://unix.stackexchange.com/questions/59281/xinitrc-not-being-run

# If using XFCE, the file '/etc/xdg/xfce4/xinitrc' may need to be copied
# (and updated) to '~/.config/xfce4/xinitrc'
#
# man startxfce4

# read ~/.Xmodmap if it exists
if [[ -f "${HOME}/.Xmodmap" ]]; then
    xmodmap "${HOME}/.Xmodmap"
fi

# read ~/.Xresources if it exists
if [[ -f "${HOME}/.Xresources" ]]; then
    xrdb -load "${HOME}/.Xresources"
#   xrdb -merge "${HOME}/.Xresources"
fi

# read ~/.xbindkeysrc if it exists
if [[ -f "${HOME}/.xbindkeysrc" ]]; then
    xbindkeys
fi

# Fixup for blank Java GUIs when running xmonad
export _JAVA_AWT_WM_NONREPARENTING=1

# use gnome-keyring-daemon to manage keys?
# /usr/bin/gnome-keyring-daemon --start --components=gpg
# /usr/bin/gnome-keyring-daemon --start --components=ssh
