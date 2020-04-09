# ~/.config/fish/config.fish
# Main fish conifuration file
# https://fishshell.com/docs/current/index.html#

# =============================================================================
# CONFIGURATIONS
# =============================================================================

# Color variables
# https://fishshell.com/docs/current/index.html#variables-color

set --global fish_color_cancel black --bold --background=red
set --global fish_color_command green
set --global fish_color_valid_path cyan
set --global fish_pager_color_prefix green

# Dir colors

if test -r ~/.ls_colors
    eval (dircolors -c ~/.ls_colors)
end

# Other stuff

export FZF_DEFAULT_OPTS="--border --info=inline --preview='test -f {}; and bat --style=numbers --color=always {} | head -50'"
export FZF_COMPLETION_TRIGGER='**'

# =============================================================================
# ALIASES
# =============================================================================

# APT

alias apta='sudo apt-get autoremove'
# alias apti='sudo apt-get install'
# alias aptr='sudo apt-get purge'
alias aptu='sudo apt-get update'
alias aptU='sudo apt-get update; sudo apt-get dist-upgrade'
alias pipi='python3 -m pip install --user --upgrade' # lolololol

function apts -d 'Searches for a package'
    apt-cache search $argv[1] | grep -i --color $argv[1]
end

# NAVIGATION

alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias vdir='vdir --color=auto'

alias ccat='bat --theme "Monokai Extended" --style changes,grid,numbers'
alias cpr='cp -r'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh'
alias rmr='rm -rf'

function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

# GIT

alias gita="git add"
# alias gitb="git branch"
# alias gitB="git checkout -b"
alias gitc="git commit -a -m"
# alias gitca="git commit --amend"
# alias gitC="git checkout"
alias gitd="git diff"
alias gitl="git log --pretty=format:'%C(yellow)%h%Creset %C(bold)%s%Creset %C(blue)<%an>%Creset %Cred%D %Creset%Cgreen(%cr)%Creset' --graph"
alias gitP="git push; git push origin --tags"
alias gitp="git pull"
alias gits="git status"
# alias gitt="git tag"

# OTHER

alias C='clear; cd ~'
alias c='clear'
alias clip='xclip -sel clip'
alias ping8='ping 8.8.8.8'
alias py='env PYTHONSTARTUP=$HOME/bin/python-prompt.py python3.8'
alias qpwgen='pwgen -Bcnsy -N 1 32'
alias qsrm="shred -n 7 -u -v -z"
alias tree="tree -a"
alias ux='chmod u+x'
