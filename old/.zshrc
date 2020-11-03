# If not running interactively, don't do anything
case $- in
    *i*)        ;;
    *)   return ;;
esac

# General configuration
setopt autocd           # $ cd lol => $ lol/
setopt completealiases
setopt extendedglob
setopt nohashdirs       # updates bin list automatically
# setopt correctall     # corrects command names
unsetopt beep nomatch

bindkey -e

# init modules
autoload -U  promptinit && promptinit
autoload -Uz compinit   && compinit

# autoload -U  colors
autoload terminfo colors && colors

# completion
zle -C complete expand-or-complete completer
zle -C complete complete-word complete-files

zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion::complete:*' cache-path ~/.zsh/cache
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# zsh-completion-generator (see
# https://github.com/RobSis/zsh-completion-generator)
GENCOMPL_FPATH=~/.zsh_completions
source ~/zsh/zsh-completion-generator/zsh-completion-generator.plugin.zsh
compinit

# history configuration
setopt histappend           # append to the history file, don't overwrite it
setopt hist_ignore_all_dups # ignore history duplicates
HISTCONTROL=ignoreboth      # no duplicates or lines starting with space
HISTSIZE=1000
HISTFILESIZE=0

# dir stack
setopt autopushd       # pushes pwd when cd
setopt pushdsilent     # silently
setopt pushdtohome
setopt pushdignoredups # ignore duplicates while pushd
setopt pushdminus
DIRSTACKSIZE=20

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# bind keys
bindkey '\e[1~' beginning-of-line # Home
bindkey '\e[4~' end-of-line       # End
bindkey '\e[3~' delete-char       # Del
bindkey '\e[2~' overwrite-mode    # Insert
bindkey '\e[7~' beginning-of-line # Home
bindkey '\e[8~' end-of-line       # End
bindkey '\eOc'  forward-word      # ctrl cursor right
bindkey '\eOd'  backward-word     # ctrl cursor left

# syntax highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
source ~/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[alias]='fg=green'
ZSH_HIGHLIGHT_STYLES[globbing]='none'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'

# prompt
setopt transient_rprompt
setopt prompt_subst

function prompt_isongit () {
    git rev-parse > /dev/null 2>&1
}

function prompt_gitbranch () {
    local BRANCH=$(git symbolic-ref HEAD 2> /dev/null\
        | sed -e 's/refs\/heads\///')
    if [[ -n "$BRANCH" ]]; then
        echo "$BRANCH"
    else
        echo "(no branch)"
    fi
}

PROMPT="┌─[%{$fg_bold[yellow]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m\
%{$reset_color%}]──[%{$fg_bold[blue]%}%~%{$reset_color%}]\$( prompt_isongit \
&& echo \"──[%{$fg_bold[green]%}\$(prompt_gitbranch)%{$reset_color%}]\" )
└──╼ "
# PROMPT="┌─[%{$fg_bold[yellow]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m\
# %{$reset_color%}]──[%{$fg_bold[blue]%}%~%{$reset_color%}]
# └──╼ "
RPROMPT="%{$fg_no_bold[magenta]%}[%?]%{$reset_color%}"

# global
[ -f ~/.shell_global ] && . ~/.shell_global

# function and aliases specific to zsh
function reloadzsh () {
    autoload -U zrecompile
    [ -f ~/.zshrc ]             && zrecompile -p ~/.zshrc
    [ -f ~/.zcompdump ]         && zrecompile -p ~/.zcompdump
    [ -f ~/.zshrc.zwc.old ]     && rm -f ~/.zshrc.zwc.old
    [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
    source ~/.zshrc
}