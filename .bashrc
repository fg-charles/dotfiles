#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# MY WORK:
set -o vi

alias cf='cd /home/cgf/.config'
alias src='cd /home/cgf/.local/src'
alias attu='ssh faisanch@attu.cs.washington.edu'
alias media='cd /run/media/cgf/EASTFUN'
alias zathura='zathura --fork'
alias tt='sc-im /home/cgf/rand/track/timetrack.sc'
alias ht='sc-im /home/cgf/rand/track/habittrack.sc'
alias cwc='foot mpv av://v4l2:/dev/video0 --profile=cam --ontop'
alias cgfserv='ssh root@cgf.pm'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
