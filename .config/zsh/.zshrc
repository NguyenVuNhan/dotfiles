figlet -f "$(ls /usr/share/figlet/figlet-fonts/*.flf | shuf -n 1)" -c NvN | lolcat
# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
# export LS_COLORS="$(vivid generate molokai)"

plugins=(
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
	history-substring-search
	colored-man-pages
	git
	virtualenv
	ubuntu
)

source "$ZSH/oh-my-zsh.sh"
source "$ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme"
source "/etc/zsh_command_not_found"

[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh
# PowerLevel
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Basic setup
autoload -U colors && colors		# Enable colors and change prompt:
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files

# Key bindding
bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Home director navigate
cdn() {
	workingDir=/mnt/NhanData
	case $1 in
	'')
		cd $workingDir/
	;;
	s)
		cd $workingDir/Study/$2
	;;
  	p)
		cd $workingDir/CodingSpace/Project/$2
	;;
	lab)
		cd $workingDir/CodingSpace/Lab
	;;
	*)
		cd $workingDir/$1
	;;
	esac
}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
