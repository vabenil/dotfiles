# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# This bahrc is such a mess you will want to cry, leaving now would be a wise decision.



# Exported variables: {{{
# Wine-staging improvements

export PATH=$PATH:/snap/bin
export STAGING_SHARED_MEMORY=1
export STAGING_RT_PRIORITY_SERVER=90
export STAGING_RT_PRIORITY_BASE=90
export CSMT=enabled
export TERMINAL=st

# }}}

# Source files: {{{
source ~/.local/bin/bashmarks.sh 
source ~/.fonts/*.sh
# }}}

# Vi mode: {{{ 
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR
# }}}

stty start undef stop undef
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

GROFF_FONT_PATH=/usr/share/groff/1.22.3/font/devps

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="\[\e[2;33m\][ \[\e[m\]\[\e[1;32m\]\u\[\e[m\]\[\e[1;32m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\]: \[\e[36m\]\$(showdirs 3) \[\e[m\]\[\e[2;33m\]]\[\e[m\]\[\e[1;37m\]\\$\[\e[m\] "
    # PS1="\[\e[31m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[33m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[37m\]\\$\[\e[m\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

 
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\'s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\''")"'

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Custom functions: {{{
# When I'm not 100% sure I want to delete a file
mvt () {
    mv -fv $@ "${HOME}/Trash/"     
}

cleant () {
    rm -rfv "${HOME}/Trash/"*
}

# show amount of directories specified
showdirs () {
    local mydir=$(dirs +0)
  
    local dir_num=$(echo $mydir | grep -o '/' | wc -l )
    local dir_len=${#mydir}

    if [ $dir_num -gt 3 ]; then
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

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

bind '"\e[Z":menu-complete'
# setting athame for advanced vim mode 

# set editing-mode vi
# set -o vi

export TERM="xterm-256color"

# bind 'set show-mode-in-prompt on'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
