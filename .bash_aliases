alias aliases='vim ~/.bash_aliases'
alias ll='ls -alF'
alias la='ls -A'
# alias l='ls -CF'

alias rm='rm -i'    # Prevent from doing something stupid
alias cpw='pwd | xclip -selection clipboard'
alias gtc='cd $(xclip -o -selection clipboard)'

alias vimrc="${EDITOR} ~/.vimrc"
alias nvimrc="${EDITOR} ~/.config/nvim/init.vim"
alias bashrc="${EDITOR} ~/.bashrc"
alias i3conf="${EDITOR} ~/.config/i3/config"

alias todo="clear && cal && task next"

alias dict="sdcv"
alias ru-en-dict="sdcv -u Full\ Russian-English" 
alias en-ru-dict="sdcv -u Full\ English-Russian" 
alias q="exit"

alias cptclip="xclip -selection clipboard"
