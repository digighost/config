# ========================================================== #
# ENV
# ========================================================== #
export CLICOLOR=1
export EDITOR=vim
export LOGIN="lefloc_l"

#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#   . /etc/bash_completion
#fi

# ========================================================== #
# History
# ========================================================== #

export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth # ignore duplication on bash history
export HISTTIMEFORMAT="%D %H:%M " # Add date on history
export HISTIGNORE="exit" # ignore commande cmd:otherCmd
export PROMPT_COMMAND='history -a' # store history immediatly
shopt -s histappend checkwinsiz # append to the history file, don't overwrite it

# ========================================================== #
# MAN PAGES COLORS
# ========================================================== #
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ========================================================== #
# PROMPT
# ========================================================== #

function set_prompt
{
  local GREEN="\[\033[0;32m\]"
  local NO_COLOUR="\[\033[0m\]"
  local BLUE_BOLD="\[\033[02;034m\]"
  local BLUE="\[\033[36m\]"
  PS1="\n$GREEN[\$(date +%H:%M)] $BLUE\w $NO_COLOUR>"
}
set_prompt;
# autocompletion up/down key with history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# ========================================================== #
# ALIAS
# ========================================================== #


# ========================== #
# basic commands rewrite
# ========================== #

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones

alias vi='vim'
alias j='jobs'
alias emacs='emacs -nw'
alias ne='emacs'

alias sc="screen -S"
alias sl="screen -ls"
alias sr="screen -r"
alias rm='mv -t ~/.local/'
alias cclean='rm -f *# *~ *.core .*# .*~ .*.core'
alias remove='/bin/rm'
alias rm='mv -t ~/.local/share/Trash/files'
alias reload='source ~/.bashrc'

alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

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

# ========================== #
# Directories
# ========================== #
alias home='cd ~/'
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias scripts='cd ~/.scripts'
alias images='cd ~/Images'

alias back='cd $OLDPWD'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# ex: up 3 (1 by default)
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

# ========================== #
# Other
# ========================== #
alias cal="clear;~/.scripts/conky/gcal_term.sh"
alias tv='vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u'
alias search="~/.scripts/recherche_google.py"
alias my_rendu="~/.scripts/safe_rendu/safe_rendu"

alias norme='~/.scripts/norme.py -verbose -score -malloc -return -libc'
alias sbt='~/.scripts/SublimeText2/sublime_text'
alias c='gcc *.c -W -Wall -Werror -Wextra ; ./a.out | cat -e'

alias upgrade='sudo aptitude update && aptitude dist-upgrade && aptitude clean'

alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30' #Show which commands you use the most
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'" #sniff GET and POST traffic over http
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete' #Delete temporary files in home directory
alias install='sudo apt-get install'
alias whead="curl --head $1"

alias :q='read -s -n1 -p "Do you realy want to quit the shell? [y]|n "; if [ "$REPLY" = y -o "$REPLY" = Y -o "$REPLY" = " " -o "$REPLY" = "" ]; then exit; else echo; unset REPLY; fi'

function mcd()
{
  mkdir -p "$1" && cd "$1";
}

find_expr()
{
  find . -type f | xargs grep -rn $1
}

# ========================================================== #
# Welcome message
# ========================================================== #
figlet "Welcome " $USER;
echo -e ""
echo -ne "Today is "; date
echo -ne "Up time:";uptime | awk /'up/'
echo "";



# ========================================================== #
#  OTHERS
# ========================================================== #

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#
findreplace(){
    printf "Search: ${1}\n"
    printf "Replace: ${2}\n"
    printf "In: ${3}\n\n"
    find . -name "*${3}" -type f | xargs perl -pi -e 's/${1}/${2}/g'
}

extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

pause() {
    if $(killall -STOP "$1"); then
        echo "[+] $1 successfully paused!"
    else
        echo "[-] Failed to pause $1"
    fi
}

unpause() {
    if $(killall -CONT "$1"); then
        echo "[+] $1 successfully unpaused!"
    else
     echo "[-] Failed to unpause $1"
    fi
}

# get current host related info
function ii()
{
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:."Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:."Not connected"}
    echo
}

#test if a file should be opened normally, or as root (vim)
argc()
{
    count=0;
    for arg in "$@"; do
        if [[ ! "$arg" =~ '-' ]]; then count=$(($count+1)); fi;
    done;
    echo $count;
}

vim()
{
    if [[ `argc "$@"` > 1 ]]; then /usr/bin/vim $@;
        elif [ $1 = '' ]; then /usr/bin/vim;
        elif [ ! -f $1 ] || [ -w $1 ]; then /usr/bin/vim $@;
    else
        echo -n "File is readonly. Edit as root? (Y/n): "
        read -n 1 yn; echo;
        if [ "$yn" = 'n' ] || [ "$yn" = 'N' ];
            then /usr/bin/vim $*;
        else
            sudo /usr/bin/vim $*;
        fi
    fi
}

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi
