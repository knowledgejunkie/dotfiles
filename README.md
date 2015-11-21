# FUD: Frequently Used Dotfiles

## Description

This repository installs and customises the following applications available on
[Debian GNU/Linux][debian] to my liking:

- [xmonad][xmonad]
- [urxvt][urxvt]
- [zsh][zsh] with [prezto][prezto]
- [vim][vim] with several plugins
- [git][git] with ctags hooks

Configurations for several other Debian-specific and general development tools
and utilities are also provided.

Scripts that I've found useful are installed into ~/.bin and $PATH is updated
to reflect this. (Yes, it's hidden. Yes, it contains binaries.)

In addition, this repository includes customisation for the following hardware:

- [Microsoft Natural Ergonomic Keyboard 4000][ergo4000]

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

    # dpkg --install knowledgejunkie-dotfiles-deps.deb
    # apt-get -f install

### Manual

To install each application and its dependencies separately, run the following
commands (as root, or via sudo) as required:

#### xmonad

    # aptitude install xmonad

#### zsh

    # aptitude install zsh

#### urxvt

    # aptitude install rxvt-unicode-256color

#### vim

    # aptitude install vim-gtk xml-twig-tools build-essential cmake python-dev libclang1 libboost-all-dev exuberant-ctags

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
Prezto and Powerline fonts for customising zsh and vim respectively.

The installation script attempts to handle situations where dotfiles (or
symlinks to them) already exist. Existing files/directories will be
automatically backed up into an epoch-dated subdirectory within
~/.dotfiles-backup. Existing symlinks to dotfiles/directories will be removed.

### Vim dependencies

JSON pretty-printing support uses json\_pp from the standard perl package.
XML pretty-printing support uses xml\_pp from the xml-twig-tools package.

The [YouCompleteMe][ycm] Vim plugin is compiled with clang semantic completion
and configured to use system clang and boost libraries, instead of downloading
them everytime the plugin is updated (which can take >30 minutes...)

On Debian-based systems the YCM install script may not find the system clang
library. It may be necessary (as root, or via sudo) to create a symlink to
ensure libclang is detected when compiling YCM (adjust path to libclang.so as
necessary):

    # cd /usr/lib/llvm-3.5/lib
    # ln -s libclang.so.1 libclang.so

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

### xinitrc for XFCE4

If you're using XFCE (with/without xmonad) you can install an updated `xinitrc`
file which enables parsing of cpp directives in the included `.Xresources`
file. This is disabled by default.

    $ cd ~/.config/xfce4
    $ ln -s ~/.xinitrc.xfce4 xinitrc

### udev rule for MS Natural Ergonomic Keyboard 4000

On a default installation of Debian, the Zoom slider key does not function as
the keycodes it emits (418,419) are >255. As a result, this key is not
passed to the running X session.

This repository includes a udev rules file to remap the key to use keycodes
<255 which can then be optionally configured via xbindkeys and xdotool
(see `.xbindkeysrc`)

    # cp ~/.dotfiles/etc/udev/rules.d/95-keymaps.rules /etc/udev/rules.d


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
[sjl-dotfiles]: http://bitbucket.org/sjl/dotfiles
[sjl-twitter]: http://twitter.com/dotvimrc
[nm-github]: https://github.com/knowledgejunkie
[nm-twitter]: http://twitter.com/nickmorrott
