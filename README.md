# FUD: Frequently Used Dotfiles

## Description

This repository installs and customises the following applications available on
[Debian GNU/Linux][debian] to my liking:

- [i3][i3]
- [urxvt][urxvt]
- [tmux][tmux]
- [zsh][zsh] with [prezto][prezto]
- [vim][vim] with several plugins
- [irssi][irssi]
- [git][git] with ctags hooks

Configurations for several other Debian-specific and general development tools
and utilities are also provided.

Colorschemes use [Solarized][solarized] where possible.

Scripts that I've found useful are installed into ~/.bin and $PATH is updated
to reflect this. (Yes, it's hidden. Yes, it contains binaries.)

In addition, this repository includes customisation for the following hardware:

- [Microsoft Natural Ergonomic Keyboard 4000][ergo4000]
- [Evoluent VM4L mouse][vm4l]

Installation of thees dotfiles is a two-step process:

- Installation of applications/dependencies
- Installation of dotfiles/dependencies


## Installing applications/dependencies

### Automatic

For straightforward installation of all applications and their dependencies
from Debian's package repositories, a meta-package is provided.

Be warned that the full suite of applications and their dependencies total
~300MiB or so, so you may want to choose to install dependencies for each
specific application if you do not use all of them (see manual installation
section below).

To install all software and dependencies via the meta-package, change to the
checkout directory and run (as root, or via sudo):

    # gdebi knowledgejunkie-dotfiles-deps.deb

### Manual

To install each application and its dependencies separately, run the following
commands (as root, or via sudo) as required:

#### i3

    # aptitude install i3 i3blocks rofi compton xautolock lightdm light-locker

#### zsh

    # aptitude install zsh

#### urxvt

    # aptitude install rxvt-unicode-256color

#### tmux

    # aptitude install tmux tmuxinator

#### vim

    # aptitude install vim-gtk xml-twig-tools build-essential cmake python-dev libclang-3.8-dev libboost-all-dev exuberant-ctags

#### git

    # aptitude install git

#### Microsoft Natural Ergonomic Keyboard 4000

    # aptitude install x11-utils evtest xbindkeys xdotool


## Installing dotfiles/dependencies

### Clone repository to ~/.dotfiles

    $ git clone https://github.com/knowledgejunkie/dotfiles ~/.dotfiles

### Run the install script

    $ cd ~/.dotfiles
    $ ./install

In addition to installing symlinks for the dotfiles provided in this
repository, the installation script also clones the upstream repositories for
Prezto and i3blocks contributed blocklets.

The installation script attempts to handle situations where dotfiles (or
symlinks to them) already exist. Existing files/directories will be
automatically backed up into an epoch-dated subdirectory within
~/.dotfiles-backup. Existing symlinks to dotfiles/directories will be removed.

### i3 dependencies

In order for "now playing" music information to be displayed in i3blocks, it is
necessary to install the [playerctl][playerctl] utility. On Debian, it is
packaged for testing/sid in the playerctl package.

### Vim dependencies

JSON pretty-printing support uses json\_xs from the libjson-xs-perl package.
XML pretty-printing support uses xml\_pp from the xml-twig-tools package.

The [YouCompleteMe][ycm] Vim plugin is compiled with clang semantic completion
and configured to use system clang and boost libraries, instead of downloading
them everytime the plugin is updated (which can take >30 minutes...)

Vim and the TagBar plugin can use tags created by ctags (exuberant-ctags). A
'git ctags' alias and hooks are provided to automatically update a Git project's
tags file after a checkout/commit/merge/rebase.

### Vim plugins

Vim plugins in this repository are managed using the [vim-plug][vim-plug]
plugin. The first time the installation script runs (or if it can't find the
Vim plugins directory) it automatically installs the plugins by calling

    # vim +PlugInstall +qall now

Subsequent running of the installation script will update the currently
configured plugins by calling

    # vim +PlugUpdate +qall now

Note: When running Vim for the first time after installation it is likely that
it will complain about missing plugin files/directories/settings. These
warnings can be safely ignored and will not appear when Vim has been run once
and plugins have been installed successfully.

### Git

A default Git templates framework is provided that will be configured with any
newly-created Git repositories after installation.

A 'git ctags' alias and hooks are provided to automatically update a
Git project's tags file after a checkout/commit/merge/rebase.

### udev rule for MS Natural Ergonomic Keyboard 4000

On a default installation of Debian, the Zoom slider key does not function as
the keycodes it emits (418,419) are >255. As a result, this key is not
passed to the running X session.

This repository includes a udev rules file to remap the key to use keycodes
<255 which can then be optionally configured via xbindkeys and xdotool
(see `.xbindkeysrc`)

    # cp ~/.dotfiles/etc/udev/rules.d/95-keymaps.rules /etc/udev/rules.d

### X11 config for Evoluent VM4L mouse

The included 90-evoluent.conf file disables the thumb buttons, which I
usually manage to trigger by accident whenever grabbing the mouse.

To install:

    # cp ~/.dotfiles/etc/X11/xorg.conf.d/90-evoluent.conf /etc/X11/xorg.conf.d/90-evoluent.conf


### X11 config for Intel GPUs

The included 20-intel.conf file should help eliminate tearing on Intel GPUs.

To install:

# cp ~/.dotfiles/etc/X11/xorg.conf.d/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf


## Fetching remote updates

Changes made to the upstream dotfiles repository and its associated submodules
can be pulled down and installed easily:

    $ cd ~/.dotfiles
    $ git pull
    $ ./install


## Thanks

Many customisations were inspired by (or blatantly copied from) vim
practitioner extraordinaire [Steve Losh][sjl-blog].

In addition to his [blog][sjl-blog] it's worth checking out his own
comprehensive [dotfiles repo][sjl-dotfiles].


## Follow me

Feel free to follow me on [GitHub][nm-github] and [Twitter][nm-twitter].

[debian]: http://www.debian.org/
[i3]: https://i3wm.org/
[zsh]: http://zsh.sourceforge.net/
[prezto]: https://github.com/sorin-ionescu/prezto
[urxvt]: http://software.schmorp.de/pkg/rxvt-unicode.html
[tmux]: https://github.com/tmux/tmux/wiki
[vim]: http://www.vim.org/
[vim-plug]: https://github.com/junegunn/vim-plug
[ycm]: https://github.com/Valloric/YouCompleteMe
[git]: http://git-scm.com/
[irssi]: https://irssi.org/
[solarized]: https://github.com/altercation/solarized
[ergo4000]: http://www.microsoft.com/hardware/en-us/p/natural-ergonomic-keyboard-4000
[vm4l]: https://evoluent.com/products/vm4l/
[sjl-blog]: http://stevelosh.com/
[sjl-dotfiles]: http://bitbucket.org/sjl/dotfiles
[nm-github]: https://github.com/knowledgejunkie
[nm-twitter]: http://twitter.com/nickmorrott
