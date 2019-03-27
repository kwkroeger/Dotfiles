## AUTO COMPLETION ##
autoload -Uz compinit

typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

## HISTORY ##
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_SPACE

## OPTIONS ##
setopt auto_cd # CD by typing directory name if it's not a command
setopt auto_list # Automatically list choices on ambiguous completion
setopt auto_menu # Automatically use menu completion
setopt always_to_end # Move cursor to end if word had one match
setopt hist_ignore_all_dups # Remove older duplicate entries from history
setopt hist_reduce_blanks # Remove superfluous blanks from history items
setopt inc_append_history # Save history entries as soon as they are entered
setopt interactive_comments # Allow comments in interactive shells
setopt share_history # Share history between different instances

## VARIABLES
. "$HOME/.variables"

## ANTIBODY ##
source <(antibody init)

antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions

## Oh My ZSH ##
ohmy=(
 'brew'
 'command-not-found'
 'cp'
 'docker'
 'docker-compose'
 'encode64'
 'extract'
 'fancy-ctrl-z'
 'git'
 'git-extras'
 'pep8'
 'pylint'
 'python'
 'screen'
 'sudo'
 'urltools'
)

for package in $ohmy; do
  antibody bundle robbyrussell/oh-my-zsh path:plugins/$package
done

## THEME ##
. "$HOME/.spaceship"

antibody bundle denysdovhan/spaceship-prompt
autoload -U promptinit && promptinit

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
BASE16_THEME="seti"

## ALIASES ##
. "$HOME/.aliases"

## BINDINGS ##
bindkey -v
bindkey '^r' history-incremental-search-backward # Ctrl+R
bindkey '^[[Z' autosuggest-accept # Shift+Tab

cd $HOME
