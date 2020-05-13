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

## ANTIBODY ##
antibody () {
	case "$1" in
		(bundle) source <( $HOME/.bin/antibody $@ ) || $HOME/.bin/antibody $@ ;;
		(*) $HOME/.bin/antibody $@ ;;
	esac
}

unset SPACESHIP_ROOT SPACESHIP_VERSION

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

antibody bundle paulirish/git-open

## THEME ##
. "$HOME/.spaceship"

antibody bundle denysdovhan/spaceship-prompt
autoload -U promptinit && promptinit

## SHARED ##
source "$HOME/.shared"

## BINDINGS ##
bindkey '^[[Z' autosuggest-accept # Shift+Tab'
bindkey '^A' beginning-of-line # A
bindkey '^E' end-of-line # E
bindkey '^S' backward-word # S
bindkey '^D' forward-word # D
bindkey "[H" beginning-of-line
bindkey "[F" end-of-line
bindkey "^M" accept-line

cd $HOME
