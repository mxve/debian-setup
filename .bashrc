case $- in
    *i*) ;;
      *) return;;
esac
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=999999
HISTFILESIZE=999999
shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored ls
LS_COLORS=$LS_COLORS:'fi=0;95:ex=1;95:di=0;94:ln=0;96:mi=0;91:or=0;91'
export LS_COLORS

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f "~/.cargo/env" ]; then
    source ~/.cargo/env
fi

PS1="\[\033[38;5;99m\](\[$(tput sgr0)\]\[\033[38;5;177m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;171m\]\u\[$(tput sgr0)\]\[\033[38;5;99m\])\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;99m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;99m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"