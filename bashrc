#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ "$SHELL" != "/bin/bash" ]; then
  export SHELL=/bin/bash
  exec /bin/bash -l
fi

export PS1="\[\e[0;91m\]\u\[\e[0;36m\]@\[\e[0;91m\]\h\[\e[0m\] \[\e[0;36m\]\W\[\e[0m\] \[\e[1;91m\]:\[\e[0m\]"

## COMPLETION ##
complete -cf sudo
set completion-ignore-case on
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ -d /usr/local/etc/bash_completion.d ] && ! shopt -oq posix; then
  for completion in /usr/local/etc/bash_completion.d/*;do
    . /usr/local/etc/bash_completion.d/completion
  done
fi

## ALIASES ##
. "$HOME/.aliases"

## HISTORY ##
export HISTCONTROL='ignoredups:ignoreboth'
export HISTSIZE=16384
export HISTFILESIZE=$HISTSIZE
export HISTTIMEFORMAT="%a %F %r "
export HISTIGNORE='&:[ ]*:clear:exit'
export PROMPT_COMMAND='history -a; history -r'
shopt -s cmdhist
shopt -s histappend

## MAIL ##
shopt -u mailwarn

## TERMINAL ##
export TERM=xterm-256color

force_color_prompt=yes
shopt -s cdspell
shopt -s checkwinsize
shopt -s nocaseglob

## THEME ##
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
BASE16_THEME="seti"

## VARIABLES ##
. "$HOME/.variables"

cd $HOME
