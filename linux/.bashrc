# ========================================================== #
# ENV
# ========================================================== #
export CLICOLOR=1
export EDITOR=vim
export HISTCONTROL=ignoredups # ignore duplication on bash history
export HISTTIMEFORMAT="%D %H:%M " # Add date
export HISTFILESIZE=800 # number max
export HISTIGNORE="exit" # ignore commande cmd:otherCmd
export LOGIN="lefloc_l"

# ========================================================== #
# PROMPT
# ========================================================== #
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\n\[\033[01;034m\]\u \[\033[36m\]\w \[\033[0m\]>'
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
     PS1='\n\[\033[01;034m\]\u \[\033[36m\]\w \[\033[0m\]>'
#PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ========================================================== #
# History
# ========================================================== #
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file, don't overwrite it
shopt -s histappend checkwinsize

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


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
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
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

alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

# ========================== #
# Other
# ========================== #
alias cal="clear;~/.scripts/conky/gcal_term.sh"
alias tv='vlc http://mafreebox.freebox.fr/freeboxtv/playlist.m3u'
alias search="~/.scripts/recherche_google.py"
alias my_rendu="~/.scripts/safe_rendu/safe_rendu"

alias norme='~/.scripts/norme.py -verbose -score -malloc -return -libc'
alias sbt='~/.scripts/SublimeText2/sublime_text'
alias c='cc ~.c -W -Wall -Werror -Wextra ; ./a.out | cat -e'

alias upgrade='sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean'
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30' #Show which commands you use the most
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
