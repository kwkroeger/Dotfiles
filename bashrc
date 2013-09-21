# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PS1="\[\e[0;91m\]\u\[\e[0;36m\]@\[\e[0;91m\]\h\[\e[0m\] \[\e[0;36m\]\W\[\e[0m\] \[\e[1;91m\]:\[\e[0m\]"

### ALIASES ###

  alias c='clear'
  
  #Make Things Look Nice
  alias cat="cat -n"
  alias df='df -h'
  alias du='du -ch'
  alias diff="$HOME/.colordiff"
  alias grep='grep --color=auto'
  alias ls='ls -hF --color=auto'
  alias mkdir='mkdir -pv'
  alias mount='mount |column -t'
  
  #Ease of Use
  alias mdstat='cat /proc/mdstat'
  alias ports='netstat -tulanp'
  alias wget='wget -c'

  #Sorry Steam Locomotive and GTI
  alias sl='ls'
  alias gti='git'

  #Programs and Script's I can't live without
  alias ack="$HOME/.ack"
  alias htop="$HOME/.htop"
  alias smem="$HOME/.smem"
  
  #Easier Back Navigation

  alias .='cd ../'
  alias ..='cd ../../'
  alias ...='cd ../../../'
  alias ....='cd ../../../../'

  #Only use X11 Forwarding Explicitly

  alias ssh='ssh -x'
  alias ssy='ssh -CY'

### COMPLETION ###	
  complete -cf sudo
  set completion-ignore-case on
  if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
      . /etc/bash_completion
  fi

### FUNCTIONS ###
  
  extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)  tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
        *.tar.gz) tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
        *.tar.xz) tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
        *.bz2)    bunzip2 $1 && cd $(basename "$1" /bz2) ;;
        *.rar)    unrar x $1 && cd $(basename "$1" .rar) ;;
        *.gz)   gunzip $1 && cd $(basename "$1" .gz) ;;
        *.tar)    tar xvf $1 && cd $(basename "$1" .tar) ;;
        *.tbz2)   tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
        *.tgz)    tar xvzf $1 && cd $(basename "$1" .tgz) ;;
        *.zip)    unzip $1 && cd $(basename "$1" .zip) ;;
        *.Z)    uncompress $1 && cd $(basename "$1" .Z) ;;
        *.7z)   7z x $1 && cd $(basename "$1" .7z) ;;
        *)    echo "don't know how to extract '$1'..." ;;
      esac
   else
       echo "'$1' is not a valid file!"
   fi
  }
  
### VARIABLES ###

  export BLOCKSIZE=M

  ## EDITOR ##
  export EDITOR='vim'
  export SVN_EDITOR='vim'
  export VISUAL='vim'

  ## LESS ##
  export LESSOPEN='|$HOME/.lesspipe/lesspipe.sh %s'
  export LESS='-R'

  ## HISTORY ##
  set history=500
  export HISTCONTROL='ignoredups:ignoreboth'
  export HISTTIMEFORMAT="%a %F %r " 
  export HISTIGNORE='&:[ ]*:clear:exit'
  export PROMPT_COMMAND='history -a; history -r'
  shopt -s cmdhist
  shopt -s histappend

  ## MAIL ##
  shopt -u mailwarn
  unset MAILCHECK

  ## TERMINAL ##
  export TERM=xterm-256color
  force_color_prompt=yes
  shopt -s checkwinsize
