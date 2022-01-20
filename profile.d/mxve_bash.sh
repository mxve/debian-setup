#!/bin/bash

# nano
## Ctrl-K cuts from cursor to end of line
## Scroll line by line, not chunk by chunk
## wrap lines to fit
## alias ee to nano

alias nano="nano -kS --softwrap"
alias ee="nano"
alias goaccess="goaccess --ignore-crawlers"

# ls
## Enable colors
## list format
## show .files
## human readable sizes

alias ls="ls -lah --color=auto"

# df & du
## human readable sizes
alias df="df -h"
alias du="du -h"

# ping
## ping 4 times
alias ping="ping -c 4"

# grep
## colors
alias grep="grep --color=auto"

# gp
## "grep process", grep from ps ax
alias gp="ps ax | grep"

# mkdir
## create parent directories
## print every directory
alias mkdir="mkdir -pv"

# logs
## docker logs
alias logs="docker logs -f"

# md
## mdr file + less
md() {
  mdr -f ${@:1} | less -r
}
