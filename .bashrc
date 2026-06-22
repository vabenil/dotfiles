#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
	. /usr/share/bash-completion/bash_completion
fi

# export PATH=$PATH:~/.local/bin:~/.local/ubin:~/.local/share/flatpak/exports/bin

# Vi mode
set -o vi

VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

source ~/.local/bin/bashmarks.sh

# Don't put duplit lines or lines starting with space in history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=65536
HISTFILESIZE=131072

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi


if [ "$color_prompt" = yes ]; then
    PS1="\[\e[2;33m\][ \[\e[m\]\[\e[1;32m\]\u\[\e[m\]\[\e[1;32m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\]: \[\e[36m\]\$(showdirs 3) \[\e[m\]\[\e[2;33m\]]\[\e[m\]\[\e[1;0m\]\\$\[\e[m\] "
else
    PS1='[\u@\h \W]\$ '
fi
unset color_prompt

alias ls='ls --color=auto'
alias grep='grep --color=auto'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# {{{
showdirs() {
    if [ -z $1 ];
    then
        dirs +0
        return
    fi

    local mydir=$(dirs +0)
  
    local dir_num=$(echo $mydir | grep -o '/' | wc -l )
    local dir_len=${#mydir}

    if [ $dir_num -gt $1 ]; then
        local count=0 
        local num=$1
        local path=""

        for (( i=$dir_len; i > 0; i--)); do
            local char="${mydir:$i:1}"
            if [ "$char" = '/' ]; then
                count=$(($count + 1))

                if [ $count -eq $num ]; then
                   break
                fi
            fi
            path="${char}${path}"
        done
        echo $path
    else
        echo $mydir
    fi
}
# }}}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/vabenil/.lmstudio/bin"
# End of LM Studio CLI section

