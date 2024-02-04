## Set up the prompt

# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Colors
autoload -U colors && colors
# Enable spell checker
setopt correct
# Set spell checker prompt style
export SPROMPT="Correct %{$fg[red]%R$reset_color%} to %{$fg[green]%r$reset_color%}? [Yes/No/Abort/Exit]: "

# Use the vim keybinding
bindkey -v

# Set global editor
export EDITOR="neovide"

# Set global terminal
export TERM="st-256color"

# Load aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
. ~/.config/aliasrc

# Set prompt
autoload -Uz vcs_info # enable vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats ' %F{34}%b%f' # [main]

precmd () { vcs_info } # always load before displaying the prompt

NEWLINE=$'\n'
PS1='%F{14}%~%f %F{27}{%*}%f${vcs_info_msg_0_} %F{118}(%?)%f${NEWLINE}%F{190}>%f '

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Autocompletion
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fuck)

# Autojump
[[ -s /home/alcen/.autojump/etc/profile.d/autojump.sh ]] && source /home/alcen/.autojump/etc/profile.d/autojump.sh

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
