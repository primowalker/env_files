#
# This is a symlink to ~/.bash_aliases
#

# Bash aliases file contains useful aliases to frequently used commands
 

alias df='df -hP'
alias ls='ls --color'
alias ll='ls -lh --color'
alias la='ls -a --color'
alias lal='ls -alh --color'
alias lt='ls -lthr --color'
alias lS='ls -lSrh --color'
alias l1='ls -1 --color'
alias grep='grep --color'
alias h='history | grep'
alias ba='cat ~/.bash_aliases'
alias ssh='ssh -o StrictHostKeyChecking=no'
alias rebash='exec $SHELL'
alias rsync='rsync -avP'
alias go='ssh -o StrictHostKeyChecking=no'
alias pip='/usr/local/bin/pip3.6'
alias get='~/bin/get_commands'
alias getaix='~/bin/get_commands-aix.sh'
alias keys='cat ~/configs/authorized_keys'
alias cpbashrc='cp ~/.bashrc ~/.bash_profile'
alias scpq='scp -q -o StrictHostKeyChecking=no -o ConnectTimeout=5'
alias d2u='dos2unix *.csv'
alias cpbash='cp ~/.bashrc ~/.bash_profile'
alias ea='vim ~/.bash_aliases'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gcheckout='git checkout'
alias scp='scp -o StrictHostKeyChecking=no -o ConnectTimeout=5'
alias sur='sudo su -'
 
