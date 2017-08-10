ZSH=$HOME/.oh-my-zsh
export CLICOLOR=1
TERM='rxvt-unicode'
COLORTERM='rxvt-unicode-256color'
ZSH_THEME="fishy"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

plugins=(history-substring-search arch mvn ant osx brew python rsync screen svn)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/texbin:.:$NDKROOT
export VERSIONER_PYTHON_PREFER_64_BIT=yes
export VERSIONER_PYTHON_PREFER_32_BIT=no
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
export NDKROOT=/usr/local/Cellar/android-ndk/r9c

PROMPT="%2~: "

alias chrome='chromium --proxy-pac-url="http://proxypac.mitre.org/sys/proxy.pac"'
alias chromium='chromium --proxy-pac-url="http://proxypac.mitre.org/sys/proxy.pac"'
alias open='xdg-open'

unsetopt correct_all

setopt interactivecomments

function disp_office() {
	xrandr --output DP-1 --auto --scale 1.5x1.5
}

function disp_mobile() {
	xrandr --output DP-1 --off
}

function gpuon() {
	sudo tee /proc/acpi/bbswitch <<<ON
	cat /proc/acpi/bbswitch
	nvidia-smi
}

function gpuoff() {
	sudo rmmod nvidia
	sudo tee /proc/acpi/bbswitch <<<OFF
	cat /proc/acpi/bbswitch
}

function proxyon() {
	export http_proxy=http://gatekeeper-w.mitre.org:80
	export https_proxy=http://gatekeeper-w.mitre.org:80
	export no_proxy=.mitre.org localhost
}

function proxyoff() {
	unset http_proxy
	unset https_proxy
	unset no_proxy
}

function aurget { 
    cd $HOME/packages/ 
    wget http://aur.archlinux.org/packages/$1/$1.tar.gz && tar -xzf $1.tar.gz && rm $1.tar.gz && cd $1 && makepkg -si
}

alias c='xclip -selection clipboard'
alias v='xclip -selection clipboard -o'
alias anyconnect='/opt/cisco/anyconnect/bin/vpnui'
alias valgrind='valgrind --suppressions=/Users/kmanville/.valgrind.supp'
alias gdb='/usr/bin/gdb'
alias playdvd='mplayer -mouse-movements dvdnav://'
alias pidgin='NSS_SSL_CBC_RANDOM_IV=0 pidgin'
alias burn='wodim -v dev=/dev/sr0'
#alias ipython='/usr/local/share/python/ipython'
#alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text'

alias ls='ls -GFh --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'
alias gr='grep -r'

function gd(){
	rel=$(dirs -p | sed -n $1p)
	echo $rel
	cd `greadlink -m $rel`
}

alias matlab='/Applications/MATLAB_R2014b.app/bin/matlab'

#sane defaults
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -p'
alias vim='vim -p'
alias df='df -h'
alias du='du -ch'
alias mkdir='mkdir -p'
alias ssh='ssh -Y'

#alias cmake='cmake -H. -Bbuild'

#common directories
alias ..='cd ..'
alias ../../='cd ../../'
alias ../../../='cd ../../../'

export HADOOP_HOME=/usr/share/hadoop
#export HADOOP_CLASSPATH=/$HADOOP_HOME/hadoop-core-1.0.1.jar:
export HADOOP_CLASSPATH=$HADOOP_HOME/hadoop-core-1.0.1.jar:/$HADOOP_HOME/hadoop-ant-1.0.1.jar:/$HADOOP_HOME/hadoop-client-1.0.1.jar:/$HADOOP_HOME/hadoop-examples-1.0.1.jar:/$HADOOP_HOME/hadoop-minicluster-1.0.1.jar:/$HADOOP_HOME/hadoop-test-1.0.1.jar:/$HADOOP_HOME/hadoop-tools-1.0.1.jar:$HADOOP_HOME/lib/commons-logging-api-1.0.4.jar
export CLASSPATH=$JAVA_HOME/java/jre/bin/:$HADOOP_CLASSPATH
export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server
export SVN_EDITOR='vim'
export WORKON_HOME=~/.venvs

__git_files () { 
    _wanted files expl 'local files' _files     
}

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
