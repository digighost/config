##
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37
##
# \a     an ASCII bell character (07)
# \d     the date  in  "Weekday  Month  Date"  format
#        (e.g., "Tue May 26")
# \e     an ASCII escape character (033)
# \h     the hostname up to the first `.'
# \H     the hostname
# \j     the  number of jobs currently managed by the shell
# \l     the basename of the shell's terminal device name
# \n     newline
# \r     carriage return
# \s     the  name  of  the shell, the basename of $0
#        (the portion following the final slash)
# \t     the current time in 24-hour HH:MM:SS format
# \T     the current time in 12-hour HH:MM:SS format
# \@     the current time in 12-hour am/pm format
# \u     the username of the current user
# \v     the version of bash (e.g., 2.00)
# \V     the release of bash,  version  +  patchlevel
# \w     the current working directory
# \W     the  basename  of the current working direcory
##

if [ -f ~/.bashrc_local ]; then
 . ~/.bashrc_local
fi

# bookmarks script
source ~/.scripts/dirb.sh

# ========================================================== #
# ENV
# ========================================================== #
export CLICOLOR=1
export EDITOR=vim
export LOGIN="lefloc_l"
export pager='less -e'

# ========================================================== #
# COLORS
# ========================================================== #
GREEN="\[\033[0;32m\]"
BLUE2="\[\033[36m\]"
LIGHT_RED="\[\033[1;31m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
NO_COLOR="\[\033[0m\]"

# ========================================================== #
# History
# ========================================================== #

export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth # ignore duplication on bash history
export HISTTIMEFORMAT="%D %H:%M " # Add date on history
export HISTIGNORE="exit" # ignore commande cmd:otherCmd
export PROMPT_COMMAND='history -a' # store history immediatly
shopt -s histappend # append to the history file, don't overwrite it

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
  previous_return_value=$?;

  if test $previous_return_value -eq 0
  then
    PS1="\r\n$LIGHT_BLUE┌ $LIGHT_RED[\u] $GREEN[\$(date +%H:%M)] $BLUE[\w]\n$LIGHT_BLUE└─>$NO_COLOR"
  else
    PS1="\r\n┌ $LIGHT_RED[\u] $GREEN[\$(date +%H:%M)] $BLUE[\w] $RED\n└─>$NO_COLOR"
  fi
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
# Fun
# ========================== #

alias busy='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias einsteiny='A=1;B=100;X=0;C=0;N=$[$RANDOM%$B+1];until [ $X -eq $N ];do read -p "N between $A and $B. Guess? " X;C=$(($C+1));A=$(($X<$N?$X:$A));B=$(($X>$N?$X:$B));done;echo "Took you $C tries, Einstein";'						# numbers guessing game
alias excuses='echo `telnet bofh.jeffballard.us 666 2>/dev/null` |grep --color -o "Your excuse is:.*$"'		# excuses
alias funfacts='wget http://www.randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias iamcow='fortune | cowsay'
alias insults='wget http://www.randominsults.net -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
alias matrix2='echo -e "\e[31m"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'
alias matrix3='COL=$(( $(tput cols) / 2 )); clear; tput setaf 2; while :; do tput cup $((RANDOM%COL)) $((RANDOM%COL)); printf "%$((RANDOM%COL))s" $((RANDOM%2)); done'
alias matrix4='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias matrix5='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=lcase,unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias roulette='[ $[ $RANDOM % 6 ] == 0 ] && echo Die || echo Live'				# command line Russian roulette
alias screensaver='for ((;;)); do echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))"; sleep 0.1 ; done'												# terminal screensaver
alias starwars='telnet towel.blinkenlights.nl'							# the famous starwars ASCII version from telnet

# Use vim as man reader

export PAGER="/bin/sh -c \"unset PAGER;col -b -x | vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
                     -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""


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
alias cclean='rm -f *# *~ *.core .*# .*~ .*.core'
alias remove='/bin/rm'
alias reload='source ~/.bashrc'
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

alias ocaml="rlwrap ocaml"

alias todo='~/.scripts/todoprog/todo.sh'

alias tmux='tmux -2' # tmux arg for set true colors on vim

function rm() {
	mv "$@" $TRASH_DIR
}

function nh() {
	nohup "$@" &>/dev/null &
}

function mcd()
{
	mkdir -p "$1" && cd "$1";
}

find_expr()
{
	find . -type f | xargs grep -rn $1
}


# cp with progress bar
function cp_p() {
	if [ `echo "$2" | grep ".*\/$"` ]
	then
		pv "$1" > "$2""$1"
	else
		pv "$1" > "$2"/"$1"
	fi
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ========================== #
# Git
# ========================== #

function cpush()
{
  git add --all ; git commit -am $1;
  read -s -n1 -p "Do you realy want push modifications ? [y]|n ";
  if [ "$REPLY" = y -o "$REPLY" = Y -o "$REPLY" = " " -o "$REPLY" = "" ]; then
    git push origin master;
  fi
}

alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# For prompt #
function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"

  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="${YELLOW}↑"
    else
      remote="${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}

function git_dirty_flag {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}
# end prompt #


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
up()
{
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
alias my_rendu="~/.scripts/safe_rendu/safe_rendu"

alias norme='~/.scripts/norme.py -verbose -score -malloc -return -libc'
alias sbt='~/.scripts/SublimeText2/sublime_text'
alias c='gcc *.c -W -Wall -Wextra ; ./a.out'

alias upgrade='sudo aptitude update && aptitude dist-upgrade && aptitude clean'

alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30' #Show which commands you use the most
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'" #sniff GET and POST traffic over http
alias sweep='find ~ -type f \( -name '*.swp' -o -name 'wget.log' -o -name 'foobar*' -o -name '*~' -o -name '.netrwhist'  \) -delete' #Delete temporary files in home directory
alias install='sudo apt-get install'
alias whead="curl --head $1"
# empty trash
alias trash='sudo rm -fr ~/.local/share/Trash/files/* && sudo rm -fr /root/.local/share/Trash/* && sudo rm -fr /root/.Trash && sudo rm -fr ~/.Trash'
alias bashrc='gvim ~/.bashrc'
alias :q='read -s -n1 -p "Do you realy want to quit the shell? [y]|n "; if [ "$REPLY" = y -o "$REPLY" = Y -o "$REPLY" = " " -o "$REPLY" = "" ]; then exit; else echo; unset REPLY; fi'
alias uml='java -jar /opt/argouml-0.34/argouml.jar &'

# Google search
function google()
{
  eval $navig "http://www.google.com/search?&num=100&q=${@}" &
}

# ========================================================== #
# Welcome message
# ========================================================== #
#figlet -c "Welcome " $USER;
echo -e ""
date
echo -ne "Uptime:";uptime | awk /'up/'
iamcow
echo "";
echo "==============================================";
todo ls
echo "==============================================";

# ========================================================== #
#  OTHERS
# ========================================================== #
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Add an "alert" alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# note function
function note()
{
  # if file doesn't exist, create it
  [ -f $HOME/.notes ] || touch $HOME/.notes
  # no arguments, print file
  if [ $# = 0 ]
  then
   cat $HOME/.notes
  # clear file
  elif [ $1 = -c ]
  then
   > $HOME/.notes
  # add all arguments to file
  else
    echo "$@" >> $HOME/.notes
  fi
}

#
findreplace(){
    printf "Search: ${1}\n"
    printf "Replace: ${2}\n"
    printf "In: ${3}\n\n"
    find . -name "*${3}" -type f | xargs perl -pi -e 's/${1}/${2}/g'
}

# ========================================================== #
#  COMPRESS / UNCOMPRESS
# ========================================================== #
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

# ========================== #
# stop/unpause a processus
# ========================== #
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
    echo -e "\nYou are logged on $HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\nUsers logged on:$NC " ; w -h
    echo -e "\nCurrent date :$NC " ; date
    echo -e "\nMachine stats :$NC " ; uptime
    echo -e "\nMemory stats :$NC " ; free
    echo -e "\nLocal IP Address :$NC" ; echo ${MY_IP:."Not connected"}
    echo -e "\nISP Address :$NC" ; echo ${MY_ISP:."Not connected"}
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

vim_Save()
{
    if [[ `argc "$@"` > 1 ]]; then vim $@;
        elif [ $1 = '' ]; then vim;
        elif [ ! -f $1 ] || [ -w $1 ]; then vim $@;
    else
        echo -n "File is readonly. Edit as root? (Y/n): "
        read -n 1 yn; echo;
        if [ "$yn" = 'n' ] || [ "$yn" = 'N' ]; then
          vim $*;
        else
            sudo vim $*;
        fi
    fi
}

# cleanly list available wireless networks (using iwlist)
function wscan()
{
  iwlist wlan0 scan | sed -ne 's#^[[:space:]]*\(Quality=\|Encryption key:\|ESSID:\)#\1#p' -e 's#^[[:space:]]*\(Mode:.*\)$#\1\n#p'
}

# ========================== #
# create a backup
# ========================== #
function bak()
{
  cp $1 $1_`date +%H:%M:%S_%d-%m-%Y`
}

# ========================== #
# bash tips
# ========================== #

# copyright 2007 - 2010 Christopher Bratusek
function bashtips() {
  echo "
    DIRECTORIES
    -----------
    pushd tmp   Push tmp && cd tmp
    popd        Pop && cd
    GLOBBING AND OUTPUT SUBSTITUTION
    --------------------------------
    ls a[b-dx]e Globs abe, ace, ade, axe
    ls a{c,bl}e Globs ace, able
    \$(ls)      \`ls\` (but nestable!)
    HISTORY MANIPULATION
    --------------------
    !!        Last command
    !?foo     Last command containing \`foo'
    ^foo^bar^ Last command containing \`foo', but substitute \`bar'
    !!:0      Last command word
    !!:^      Last command's first argument
    !\$       Last command's last argument
    !!:*      Last command's arguments
    !!:x-y    Arguments x to y of last command
    C-s       search forwards in history
    C-r       search backwards in history
    LINE EDITING
    ------------
    M-d     kill to end of word
    C-w     kill to beginning of word
    C-k     kill to end of line
    C-u     kill to beginning of line
    M-r     revert all modifications to current line
    C-]     search forwards in line
    M-C-]   search backwards in line
    C-t     transpose characters
    M-t     transpose words
    M-u     uppercase word
    M-l     lowercase word
    M-c     capitalize word
    COMPLETION
    ----------
    M-/     complete filename
    M-~     complete user name
    M-@     complete host name
    M-\$    complete variable name
    M-!     complete command name
    M-^     complete history
    "
}


# ========================== #
# CLOCKS
# ========================== #
function countdown()
{
  local OLD_IFS="${IFS}"
  IFS=":"
  local ARR=( $1 )
  local SECONDS=$(((ARR[0] * 60) + (ARR[1] * 60) + ARR[2]))
  local START=$(date +%s)
  local END=$((START + SECONDS))
  local CUR=$START

  while [[ $CUR -lt $END ]]
  do
    CUR=$(date +%s)
    LEFT=$((END-CUR))

    printf "\r%02d:%02d:%02d" \
    $((LEFT/3600)) $(( (LEFT/60)%60)) $((LEFT%60))

    sleep 1
  done
  IFS="${OLD_IFS}"
  echo "        "
  alert "Countdown finished !!"
}


# ========================== #
# crypto
# ========================== #
# copyright 2007 - 2010 Christopher Bratusek
function checksum()
{
	action=$1
	shift
	if [[ ( $action == "-c" || $action == "--check" ) && $1 == *.* ]]; then
		type="${1/*./}"
	else	type=$1
		shift
	fi
	case $type in
		md5 )
			checktool=md5sum
		;;
		sha1 | sha )
			checktool=sha1sum
		;;
		sha224 )
			checktool=sha224sum
		;;
		sha256 )
			checktool=sha256sum
		;;
		sha384 )
			checktool=sha384sum
		;;
		sha512 )
			checktool=sha512sum
		;;
	esac
	case $action in
		-g | --generate )
			for file in "${@}"; do
				$checktool "${file}" > "${file}".$type
			done
		;;
		-c | --check )
			for file in "${@}"; do
				if [[ "${file}" == *.$type ]]; then
					$checktool --check "${file}"
				else	$checktool --check "${file}".$type
				fi
			done
		;;
		-h | --help )
		;;
	esac
}

# MD5 checksum
function md5()
{
    echo -n $@ | md5sum
}

# ========================================================== #
#  progressbar
# ========================================================== #

# copyright 2007 - 2010 Christopher Bratusek
function progressbar()
{
	SP_COLOUR="\e[37;44m"
	SP_WIDTH=5.5
	SP_DELAY=0.2
	SP_STRING=${2:-"'|/=\'"}
	while [ -d /proc/$1 ]
	do
		printf "$SP_COLOUR\e7  %${SP_WIDTH}s  \e8\e[01;37m" "$SP_STRING"
		sleep ${SP_DELAY:-.2}
		SP_STRING=${SP_STRING#"${SP_STRING%?}"}${SP_STRING%?}
	done
	tput sgr0
}

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi
