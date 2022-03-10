#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.

#

# This is a custome bashrc file for Linux servers

# James Walker

# Created - July 5, 2018

 

# Color mapping

grey='\[\033[1;30m\]'

red='\[\033[0;31m\]'

RED='\[\033[1;31m\]'

green='\[\033[0;32m\]'

GREEN='\[\033[1;32m\]'

yellow='\[\033[0;33m\]'

YELLOW='\[\033[1;33m\]'

purple='\[\033[0;35m\]'

PURPLE='\[\033[1;35m\]'

white='\[\033[0;37m\]'

WHITE='\[\033[1;37m\]'

blue='\[\033[0;34m\]'

BLUE='\[\033[1;34m\]'

cyan='\[\033[0;36m\]'

CYAN='\[\033[1;36m\]'

NC='\[\033[0m\]'

 

# If not running interactively, don't do anything

[ -z "$PS1" ] && return

 

# check the window size after each command and, if necessary,

# update the values of LINES and COLUMNS.

shopt -s checkwinsize

 

# make less more friendly for non-text input files, see lesspipe(1)

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

 

# uncomment for a colored prompt, if the terminal has the capability; turned

# off by default to not distract the user: the focus in a terminal window

# should be on the output of commands, not on the prompt

#force_color_prompt=yes

 

 

### Alias definitions.

# You may want to put all your additions into a separate file like

# ~/.bash_aliases, instead of adding them here directly.

# See /usr/share/doc/bash-doc/examples in the bash-doc package.

 

if [ -f ~/.bash_aliases ]; then

    . ~/.bash_aliases

fi

 

# Get the bash history, but without the line numbers and dates

function hcmd {

                cmd=$1

                history | grep $cmd | cut -d\  -f6- | grep -v 'hcmd '

}

alias hc='hcmd'

 

# Enable programmable completion features (you don't need to enable

# this, if it's already enabled in /etc/bash.bashrc and /etc/profile

# sources /etc/bash.bashrc).

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then

    . /etc/bash_completion

fi

export PATH=$PATH:/bin:/usr/bin:/opsw/bin:/home/f8tg2la/bin:/home/f8tg2la/bin/admin_files:/usr/bin/python:/cygdrive/c/Users/f8tg2la/AppData/Local/Programs/Python/Python38:/cygdrive/c/Users/f8tg2la/fde/Scripts:~/bin/Patching

 

 

### This section controls the function of bash history

# This line will format the date and time that is tagged onto the begining of each output line from the 'history' command

# For example, the below command will format the output of the history command like this:

# 08/14/15 07:40:59 vim list

export HISTTIMEFORMAT="%m/%d/%y %T "

 

# Don't put duplicate lines in the history. See bash(1) for more options

# ... or force ignoredups and ignorespace

HISTCONTROL=ignoredups:ignorespace

 

# Append to the history file, don't overwrite it

shopt -s histappend

 

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)

HISTSIZE=9000

HISTFILESIZE=$HISTSIZE

 

# Update .bash_history after every command and from multiple concurrent sessions

#export PROMPT_COMMAND='history -a'

_bash_history_sync() {

        builtin history -a                      # Append the just entered line to the $HISTFILE (default is .bash_history).

                                                                # This will cause $HISTFILE to grow by one line.

        HISTFILESIZE=$HISTSIZE          # Setting the special variable $HISTFILESIZE to some value will cause Bash to truncate $HISTFILE to be

                                                                # no longer than $HISTFILESIZE lines by removing the oldest entries

        builtin history -c                      # Clear the history of the running session. This will reduce the history counter by the amount of $HISTSIZE

        builtin history -r                      # Read the contents of $HISTFILE and insert them in to the current running session history.

                                                                # This will raise the history counter by the amount of lines in $HISTFILE.

                                                                # Note that the line count of $HISTFILE is not necessarily $HISTFILESIZE.

}

 

history() {                                     # The history() function overrides the builtin history to make sure that the history is synchronised before

                                                        # it is displayed. This is necessary for the history expansion by number

_bash_history_sync

builtin history "$@"

}

 

# get current branch in git repo

function parse_git_branch() {

        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

        if [ ! "${BRANCH}" == "" ]

        then

                STAT=`parse_git_dirty`

                echo "[${BRANCH}${STAT}]"

        else

                echo ""

        fi

}

 

# get current branch in git repo

function parse_git_branch() {

        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

        if [ ! "${BRANCH}" == "" ]

        then

                STAT=`parse_git_dirty`

                echo "[${BRANCH}${STAT}]"

        else

                echo ""

        fi

}

 

# get current status of git repo

function parse_git_dirty {

        status=`git status 2>&1 | tee`

        dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`

        untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`

        ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`

        newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`

        renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`

        deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`

        bits=''

        if [ "${renamed}" == "0" ]; then

                bits=">${bits}"

        fi

        if [ "${ahead}" == "0" ]; then

                bits="*${bits}"

        fi

        if [ "${newfile}" == "0" ]; then

                bits="+${bits}"

        fi

        if [ "${untracked}" == "0" ]; then

                bits="?${bits}"

        fi

        if [ "${deleted}" == "0" ]; then

                bits="x${bits}"

        fi

        if [ "${dirty}" == "0" ]; then

                bits="!${bits}"

        fi

        if [ ! "${bits}" == "" ]; then

                echo " ${bits}"

        else

                echo ""

        fi

}

 

export PS1="\[\e[35m\]\u\[\e[m\]\[\e[35m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\] \[\e[35m\]\w\[\e[m\]\[\e[31;40m\]\`parse_git_branch\`\[\e[m\]\[\e[35m\]\\$\[\e[m\] "

 

case "$TERM" in

        xterm*|rxvt*)

    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

    ;;

                *)

    ;;

esac
