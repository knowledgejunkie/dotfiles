# Dotfiles

## Description

A dotfiles repo for my Debian systems

## Prerequisites

This setup customises the following key software packages on [Debian testing/jessie][debian]:

- [xmonad][xmonad] (aptitude install xmonad)
- [zsh][zsh] with [prezto][prezto] (aptitude install zsh)
- [urxvt][urxvt] (aptitude install rxvt-unicode-256color)
- [vim][vim] (aptitude install vim-nox vim-gtk)
- [git][git] (aptitude install git)

Configurations for several other tools/utilities are also provided.

This setup also includes customisations for the following hardware:

- [Microsoft Natural Ergonomic Keyboard 4000][ergo4000] (aptitude install x11-utils evtest xbindkeys xdotool)


## Installation

### Open a Zsh shell

    $ zsh

### Clone this repository to ~/.dotfiles

    $ git clone https://github.com/knowledgejunkie/dotfiles ~/.dotfiles

Note: the `.gitconfig` config file included in this repository includes a
`git cloneall` alias providing a shortcut to `git clone --recursive`. This alias
enables a remote repository and all of its associated submodules to be retrieved
in one hit.

### Run the install script

    $ ./install

In addtion to installing symlinks for the dotfiles provided in this repository, the
installation script also clones the upstream repositories for Prezto and
Powerline fonts.

Note: the installation script currently exits if it encounters an existing dotfile
when attempting to create symlinks from dotfiles in this repository.

Please backup and remove any files/directories that the installation script aborts
on, and re-run the script.

### (Optional) Install udev rule for MS Natural Ergonomic Keyboard 4000

On a default installation of Debian, the Zoom slider key does not function as
the keycodes it emits (418,419) are >255. As a result, this key is not 
passed to the running X session.

This repository includes a udev rules file to remap the key to use keycodes
<255 which can then be optionally configured via xbindkeys and xdotool
(see `.xbindkeysrc`)

    # cp ~/.dotfiles/etc/udev/rules.d/95-keymaps.rules /etc/udev/rules.d

### Install Vim plugins

Vim plugins in this repository are managed using the [vim-plug][vim-plug] plugin.
After successfully running the installation script, it is necessary to install
the Vim plugins from within Vim by calling the PlugInstall command:

    $ vim
    :PlugInstall

Note: The [YouCompleteMe][ycm] plugin is compiled with clang semantic completion and
requires the build-essential, cmake and python-dev packages to be installed

Note: When running vim for the first time after installation of these dotfiles, it is
highly likely that it will complain about missing plugin files/settings. These warnings
can be safely ignored and will not appear when plugins have been installed.

### (Optional) Install xinitrc for XFCE4

If you're using XFCE (with/without xmonad) you can install an updated `xinitrc`
file which enables parsing of cpp directives in the included `.Xresources`
file. This is disabled by default.

    $ cd ~/.config/xfce4
    $ ln -s ~/.xinitrc.xfce4 xinitrc

## Fetching remote updates

Changes made to the upstream dotfiles repository and its associated submodules
can be pulled down easily:

    $ cd ~/.dotfiles
    $ git pull

## Thanks

Many customisations were inspired by (or blatantly copied from) vim
practitioner extraordinaire [Steve Losh][sjl-blog].

In addition to his [blog][sjl-blog] it's worth following his own
comprehensive [dotfiles repo][sjl-dotfiles] and following the excellent
[dotvimrc Twitter feed][sjl-twitter] he runs.

Feel free to follow me on [GitHub][nm-github] and [Twitter][nm-twitter].

[debian]: http://www.debian.org/
[xmonad]: http://xmonad.org/
[zsh]: http://zsh.sourceforge.net/
[prezto]: https://github.com/sorin-ionescu/prezto
[urxvt]: http://software.schmorp.de/pkg/rxvt-unicode.html
[vim]: http://www.vim.org/
[vim-plug]: https://github.com/junegunn/vim-plug
[ycm]: https://github.com/Valloric/YouCompleteMe
[git]: http://git-scm.com/
[ergo4000]: http://www.microsoft.com/hardware/en-us/p/natural-ergonomic-keyboard-4000
[sjl-blog]: http://stevelosh.com/
[sjl-dotfiles]: https://github.com/sjl/dotfiles
[sjl-twitter]: http://twitter.com/dotvimrc
[nm-github]: https://github.com/knowledgejunkie
[nm-twitter]: http://twitter.com/nickmorrott
