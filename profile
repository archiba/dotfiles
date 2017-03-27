# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.dotfiles/bin" ] ; then
    PATH="$HOME/.dotfiles/bin:$PATH"
fi

if [ -f "$HOME/.profile" ] ; then
    echo "Including $HOME/.profile"
    source "$HOME/.profile"
fi

if [ -d "$HOME/.pyenv" ] ; then
  echo "Exporting pyenv $HOME/.pyenv"
  export PYENV_ROOT="$HOME/.pyenv"
fi

if [ -d "$PYENV_ROOT/bin" ] ; then
  echo "Including $PYENV_ROOT/bin"
  PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [ -d "$PYENV_ROOT/shims" ] ; then
  echo "Including $PYENV_ROOT/shims"
  PATH="$PYENV_ROOT/shims:$PATH"
fi

if [ -f "$PYENV_ROOT/version" ] ; then
  echo "Setting pyenv version `cat $PYENV_ROOT/version`"
  pyenv global `cat $PYENV_ROOT/version`
  pyenv rehash
  echo "Setting path with pyenv python bin"
  export PATH="$PYENV_ROOT/versions/`cat $PYENV_ROOT/version`/bin:$PATH"
fi
