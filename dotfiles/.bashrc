# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

shopt -s histappend     # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth  # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=1000
HISTFILESIZE=0

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"
[ -d /opt/homebrew/sbin ] && export PATH="/opt/homebrew/sbin:$PATH"
[ -d /opt/homebrew/share/info ] && export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"
[ -d /opt/homebrew/share/man ] && export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
[ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"
[ -d $HOME/.scripts ] && export PATH="$PATH:$HOME/.scripts"
[ -d $HOME/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"
[ -d $HOME/.cargo/env ] && export PATH="$PATH:$HOME/.cargo/env"

[ -f ~/.shell_global ] && source ~/.shell_global
[ -f ~/.shell_prompt ] && . ~/.shell_prompt
