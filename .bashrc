# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

#make pip convenient
alias dopip="sudo -H pip install ${1} && sudo -H pip3 install ${1}"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

# User specific aliases and functions
alias ls="ls -lrtha --color"
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
alias lxplus="ssh -Y kirby@lxplus.cern.ch"
alias lxplus5="ssh -Y kirby@lxplus5.cern.ch"
alias glasgow="ssh -Y gkirby@ppelx.physics.gla.ac.uk"
alias will_server="ssh lrh@www.wdbm.pro"
alias wokr='work'
alias testspeed='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias emasc='emacs'
alias emcas='emacs'
alias e='emacs'
alias g='geany'
alias sl="ls"
alias ks="ls"
alias l="ls"
alias e="emacs"
alias en="emacs -nw"
alias rmtd="rm *~"
alias rmftd="rm -f *~"
alias moer="more"
alias seagate="cd /media/gavin/Seagate\ Expansion\ Drive/"
alias ana_nav="nohup anaconda-navigator >& /dev/null &"
alias chrome="nohup google-chrome >& /dev/null &"
alias firefox="nohup firefox >&/dev/null &"
alias thunderbird="nohup ~/thunderbird.sh >&/dev/null &"
alias truecrypt="nohup truecrypt &"
#alias tor="nohup /home/gavin/Downloads/tor-browser_en-US/start-tor-browser &"
#alias will_setup="source $(curl -L -ss http://www.wdbm.pro/libgeneralppelx)"
alias wget_lynx="wget --user-agent=Lynx"
alias dvorak="setxkbmap dvorak"
alias conky="nohup conky >& /dev/null &"
alias flair="nohup flair >& /dev/null &"
PS1="[\t] \u@\h \w > "
export CERNUSER=kirby
export CERN_USER=kirby
export FLUPRO=/home/gavin/fluka
export FLUFOR=gfortran
alias doping="ping 192.168.1.1"
alias rm="rm -i"
alias can="mv \!* ~/.trashcan"       # junk file(s) to trashcan
alias mtcan="rm -f ~/.trashcan/*"      # irretrievably empty trash
alias doupgrades="sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoremove && sudo apt -y autoclean && sudo snap refresh"
alias upgrade_electrum="sudo pip3 install https://download.electrum.org/3.0.5/Electrum-3.0.5.tar.gz"
alias utc="sudo timedatectl set-timezone UTC"
alias cdphone="/run/user/1000/gvfs/"
alias isodateutc="date -u +"%Y-%m-%dT%H:%M:%SZ""
alias isodate="date +%Y-%m-%dT%H:%M:%S%z"
alias turtl="sudo nohup /opt/turtl/turtl >& /dev/null &"
alias virtual_py3="virtualenv -p /usr/bin/python3 py3env"
alias popcorntime="/home/gavin/popcorntime/Popcorn-Time"
alias root="/home/gavin/root-6.14.04/builddir/bin/root -l"
#alias julia="/home/gavin/julia-1.0.0/bin/julia"
alias gs_server="ssh gk@91.121.71.162"
alias countdown="/home/gavin/Dropbox/Projects/scripts/countdown.sh"
#alias show_recent_files='awk -F"file://|\" " '/file:\/\// {print $2}' ~/.local/share/recently-used.xbel'
#alias wayOrX="sudo loginctl show-session 2 -p Type"
alias yi="/home/gavin/yi/.cabal-sandbox/bin/yi"

#Pass the name (without extension) of a .tex file to remove all
#accumulated compile-time crap.
function cleanup_latex ()
{
    if [ ! -f $1.tex ]; then echo "File $1.tex does not exist in this directory!"; exit 1;  fi

    for extension in out log nav toc snm aux
    do
	rm -f $1.$extension
    done
    return 0
}

function wayOrX()
{
mySessionsData=$(sudo loginctl | grep $USER)
mySessionId=$(echo $mySessionsData | cut -d ' ' -f 1)
mySessionType=$(loginctl show-session ${mySessionId} -p Type)
echo $mySessionType
}

function dllinks
{
    wget --mirror -p --html-extension --convert-links "$1"
}

function mcd
{
    mkdir "$1"; cd "$1"    
}

if [ ! -d ~/.trashcan ]
then
mkdir ~/.trashcan   # ensure trashcan exists
fi
export GOPATH=/home/gavin/go
export PATH=/home/gavin/bin:/home/gavin/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/gavin/go/bin:/usr/local/go/bin
#for antlr
export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

# added by Miniconda2 4.3.21 installer
# amended not to ovewrite default
export PATH="$PATH:/home/gavin/miniconda2/bin"
export PATH=~/.rakudobrew/bin:$PATH

# added by Anaconda3 installer
export PATH="$PATH:/home/gavin/anaconda3/bin"

#Make Atom the default text editor
export VISUAL="/usr/bin/atom"
export EDITOR="$VISUAL"
export GENERAL_SOLUTIONS_DIR="${HOME}"/gs
venvgs(){
    source "${GENERAL_SOLUTIONS_DIR}"/venv/bin/activate
}
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/gavin/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/gavin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gavin/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/gavin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
