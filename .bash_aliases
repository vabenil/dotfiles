alias aliases='vim ~/.bash_aliases'
alias ll='ls -alF'
alias la='ls -A'
# alias l='ls -CF'
alias cpw='pwd | xclip -selection clipboard'
alias gtc='cd $(xclip -o -selection clipboard)'
alias tmu='tmux a'

alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.config/nvim/init.vim"
alias bashrc="vim ~/.bashrc"
alias i3conf="vim ~/.config/i3/config"

alias search="apt search"
alias install="sudo apt install"
alias remove="sudo apt remove"

alias dict="sdcv"
alias ru-en-dict="sdcv -u Full\ Russian-English" 
alias en-ru-dict="sdcv -u Full\ English-Russian" 
alias q="exit"

alias cptclip="xclip -selection clipboard"
# For visual novels
alias wine-jp="LC_ALL='ja_JP.UTF8' wine"
alias wine-64="WINEPREFIX=\"${HOME}/.local/share/wineprefixes/wine64\" wine"
# My prefix with Vulkan
alias wine-32="WINEPREFIX=~/.local/share/wineprefixes/wine32 wine-development"
alias wine-all="LC_ALL='ja_JP.UTF8' WINEPREFIX=~/.local/share/wineprefixes/wine32 wine-development"
