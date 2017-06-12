# Command Prompt
export PS1="\[\e]0;\u@\h: \w\a\]\[\033[00;33m\]\u@\h\[\033[00m\]:\[\033[00;31m\]\w\[\033[00m\]\$ "

# Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# grep
alias grep='grep -v grep | grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -l'

# simple calculator
function calc () {
        { echo "$*" | bc -l; }
}

# icanhazip.com
alias myip='curl -4 -s icanhazip.com'
alias whatismyip=myip
alias cpip='myip | pbcopy'

# flush mac dns cache
alias flushdns='sudo killall -HUP mDNSResponder'

# UI Apps
alias cakebrew='open /Applications/Cakebrew.app'
alias logs='open /Applications/Utilities/Console.app'

# colors - reminder how to achieve colored output
function colors () {
	echo "Colors:"
	echo -e "\033[00;30mBlack\t\t0;30\033[0m"
	echo -e "\033[01;30mDark Gray\t1;30\033[0m"
	echo -e "\033[00;34mBlue\t\t0;34\033[0m"
	echo -e "\033[01;34mLight Blue\t1;34\033[0m"
	echo -e "\033[00;32mGreen\t\t0;32\033[0m"
	echo -e "\033[01;32mLight Green\t1;32\033[0m"
	echo -e "\033[00;36mCyan\t\t0;36\033[0m"
	echo -e "\033[01;36mLight Cyan\t1;36\033[0m"
	echo -e "\033[00;31mRed\t\t0;31\033[0m"
	echo -e "\033[01;31mLight Red\t1;31\033[0m"
	echo -e "\033[00;35mPurple\t\t0;35\033[0m"
	echo -e "\033[01;35mLight Purple\t1;35\033[0m"
	echo -e "\033[00;33mBrown\t\t0;33\033[0m"
	echo -e "\033[01;33mYellow\t\t1;33\033[0m"
	echo -e "\033[00;37mLight Gray\t0;37\033[0m"
	echo -e "\033[01;37mWhite\t\t1;37\033[0m"
}

# java
# export JAVA_HOME=`/usr/libexec/java_home -v 1.7`

# GPG
export GPG_HOME="/usr/local/gnupg-2.1"

export PATH=$PATH:$GPG_HOME/bin

# brew
export PATH=/usr/local/bin:$PATH

# ~/bin
#export PATH=/Users/d/bin:$PATH

# ssh auto complete
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        #comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
        #                cut -f 1 -d ' ' | \
        #                sed -e s/,.*//g | \
        #                grep -v ^# | \
        #                uniq | \
        #                grep -v "\[" ;
        #                grep "^Host " | \
        #                awk '{print $2}'
        comp_ssh_hosts=`cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
#complete -F _complete_ssh_hosts ssh
#complete -F _complete_ssh_hosts mosh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
complete -F _complete_ssh_hosts ssh
complete -F _complete_ssh_hosts mosh

alias kmsg='adb shell su -c "cat /proc/kmsg"'
alias klsmod='adb shell su -c "ls -l /sys/module/"'
alias recovery='adb reboot recovery'
alias shell='fb-adb shell'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile
