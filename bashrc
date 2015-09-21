# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ "$SHELL" != "/bin/bash" ];then
  export SHELL=/bin/bash
  exec /bin/bash -l
fi

export PS1="\[\e[0;91m\]\u\[\e[0;36m\]@\[\e[0;91m\]\h\[\e[0m\] \[\e[0;36m\]\W\[\e[0m\] \[\e[1;91m\]:\[\e[0m\]"

# Set Color
if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

# Base16 Bright
color00="00/00/00" # Base 00 - Black
color01="fb/01/20" # Base 08 - Red
color02="a1/c6/59" # Base 0B - Green
color03="fd/a3/31" # Base 0A - Yellow
color04="6f/b3/d2" # Base 0D - Blue
color05="d3/81/c3" # Base 0E - Magenta
color06="76/c7/b7" # Base 0C - Cyan
color07="e0/e0/e0" # Base 05 - White
color08="50/50/50" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="fc/6d/24" # Base 09
color17="be/64/3c" # Base 0F
color18="30/30/30" # Base 01
color19="50/50/50" # Base 02
color20="d0/d0/d0" # Base 04
color21="f5/f5/f5" # Base 06
color_foreground="e0/e0/e0" # Base 05
color_background="00/00/00" # Base 00
color_cursor="e0/e0/e0" # Base 05

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg e0e0e0 # forground
  printf $printf_template_custom Ph 000000 # background
  printf $printf_template_custom Pi e0e0e0 # bold color
  printf $printf_template_custom Pj 505050 # selection color
  printf $printf_template_custom Pk e0e0e0 # selected text color
  printf $printf_template_custom Pl e0e0e0 # cursor
  printf $printf_template_custom Pm 000000 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor

### ALIASES ###

  alias c='clear'
  alias g='git'
  alias vi='vim'

  #Make Things Look Nice
  alias df='df -h'
  alias du='du -ch'
  alias diff="$HOME/.colordiff"
  alias gcp="$HOME/.gcp/gcp"
  alias grep='grep --color=auto'
  alias ls='ls -hF --color=auto'
  alias mkdir='mkdir -pv'
 
  # Enable aliases to be sudo’ed
  alias sudo='sudo '

  #Ease of Use
  alias mdstat='cat /proc/mdstat'
  alias ports='netstat -tulanp'
  alias wget='wget -c'

  #Sorry Steam Locomotive and GTI
  alias sl='ls'
  alias gti='git'

  #Programs and Script's I can't live without
  alias ack="$HOME/.pt"
  alias htop="$HOME/.htop"
  alias pt="$HOME/.pt"
  alias smem="$HOME/.smem"

  #Easier Back Navigation
  alias .='cd ../'
  alias ..='cd ../../'
  alias ...='cd ../../../'
  alias ....='cd ../../../../'

  #Only use X11 Forwarding Explicitly

  alias ssh='ssh -x'
  alias ssy='ssh -CX -c arcfour,blowfish-cbc'

### COMPLETION ###	
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

### FUNCTIONS ###
  
  e () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2) tar xvjf $1 && cd $(basename "$1" .tar.bz2) ;;
        *.tar.gz)  tar xvzf $1 && cd $(basename "$1" .tar.gz) ;;
        *.tar.xz)  tar Jxvf $1 && cd $(basename "$1" .tar.xz) ;;
        *.bz2)     bunzip2 $1 && cd $(basename "$1" /bz2) ;;
        *.rar)     unrar x $1 && cd $(basename "$1" .rar) ;;
        *.gz)      gunzip $1 && cd $(basename "$1" .gz) ;;
        *.tar)     tar xvf $1 && cd $(basename "$1" .tar) ;;
        *.tbz2)    tar xvjf $1 && cd $(basename "$1" .tbz2) ;;
        *.tgz)     tar xvzf $1 && cd $(basename "$1" .tgz) ;;
        *.zip)     unzip $1 && cd $(basename "$1" .zip) ;;
        *.Z)       uncompress $1 && cd $(basename "$1" .Z) ;;
        *.7z)      7z x $1 && cd $(basename "$1" .7z) ;;
        *)         echo "don't know how to extract '$1'..." ;;
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
  unset MAILCHECK

  ## TERMINAL ##
  export TERM=xterm-256color
  
  force_color_prompt=yes
  shopt -s cdspell
  shopt -s checkwinsize
  shopt -s nocaseglob

## Personal Addons
alias update='brew update; brew upgrade; brew cleanup; sudo gem update'

#RCAC Addition
alias edac='grep "[0-9]" /sys/devices/system/edac/mc/mc*/csrow*/ch*_ce_count; grep "[0-9]" /sys/devices/system/edac/mc/mc*/ue_count; grep "[0-9]" /sys/devices/system/edac/mc/mc*/ce_count'
alias cfupdate="sudo /var/cfengine/bin/cfagent -qvK"
alias shatter="rdesktop shatter2 -g 1680x1050"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/games:/usr/site/rcac/scripts:/sbin:/usr/pbs/bin/:/apps/rhel5/iperf/bin:/usr/sbin:/opt/condor/sbin

cd $HOME
