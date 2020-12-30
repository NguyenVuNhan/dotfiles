# Fetch
figlet -f "$(ls /usr/share/figlet/figlet-fonts/*.flf | shuf -n 1)" -c NvN | lolcat

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Themming with PowerLevel
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
source "$ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Basic setup
source "/etc/zsh_command_not_found"
plugins=(
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
	colored-man-pages
	git
	virtualenv
)

autoload -U colors && colors		                                # Enable colors and change prompt:
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
_comp_options+=(globdots)		                                    # Include hidden files

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
bindkey -s '^O' 'lfcd\n'

# Addition key bindding for fzf
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh
bindkey -s '^P' 'vf\n'

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
[[ ! -f ~/.local/share/cargo/env ]] || source ~/.local/share/cargo/env

source $ZSH/oh-my-zsh.sh

# Vim key bindding
bindkey -v

[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"  # Aliases
