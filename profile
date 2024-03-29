#!/usr/bin/env bash
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

if [ -f "/usr/local/bin/brew" ] ; then
  echo "Including /usr/local/bin for Homebrew"
  PATH="/usr/local/bin:$PATH"
fi

if [ -d "$HOME/.nodebrew" ] ; then
  echo "Exporting nodebrew $HOME/.nodebrew/current/bin"
  PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

if [ -d "$HOME/.pyenv" ] ; then
  echo "Exporting pyenv $HOME/.pyenv"
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init -)"
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
  pyenv global `cat ${PYENV_ROOT}/version`
  pyenv rehash
  echo "Setting path with pyenv python bin"
  # export PATH="$PYENV_ROOT/versions/`head -n 1 $PYENV_ROOT/version`/bin:$PATH"
fi

if [ `uname` = "Darwin" ] ; then
    if [ -d "/usr/local/Cellar/llvm" ] ; then
        llvm_version=`ls /usr/local/Cellar/llvm`
        echo "Setting LLVM ${llvm_version} path."
        export DYLD_LIBRARY_PATH=/usr/local/Cellar/llvm/${llvm_version}/lib:${DYLD_LIBRARY_PATH}
        export LD_LIBRARY_PATH=/usr/local/Cellar/llvm/${llvm_version}/lib:${LD_LIBRARY_PATH}
        export CPATH=/usr/local/Cellar/llvm/${llvm_version}/include:${CPATH}
        export PATH=$PATH:/usr/local/Cellar/llvm/${llvm_version}/bin
    fi
fi

if [ -f "$HOME/.profile" ] ; then
    echo "Including $HOME/.profile"
    source "$HOME/.profile"
fi
