# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# prefer homebrew version

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export CLICOLOR=1
ZSH_THEME="fishy"

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(history-substring-search mvn ant osx brew python rsync screen svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/texbin:.
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/opt/cuda-toolkit/bin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/core_perl
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

PROMPT="%2~: "

unsetopt correct_all

function displab() {
	disper -e -d DFP-4,DFP-2
}

function proxyon() {
	export http_proxy=http://gatekeeper-w.mitre.org:80
	export HTTP_PROXY=http://gatekeeper-w.mitre.org:80
}

function proxyoff() {
	unset http_proxy
	unset HTTP_PROXY
}

function aurget { 
    cd $HOME/packages/ 
    wget http://aur.archlinux.org/packages/$1/$1.tar.gz && tar -xzf $1.tar.gz && rm $1.tar.gz && cd $1 && makepkg -si
}

alias valgrind='valgrind --suppressions=/Users/kmanville/.valgrind.supp'
alias gdb='/usr/bin/gdb'
alias playdvd='mplayer -mouse-movements dvdnav://'
alias pidgin='NSS_SSL_CBC_RANDOM_IV=0 pidgin'
alias burn='wodim -v dev=/dev/sr0'
#alias ipython='/usr/local/share/python/ipython'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias truecrypt='/Applications/TrueCrypt.app/Contents/MacOS/Truecrypt --text'

alias ls='ls -GFh'
alias ll='ls -l'
alias la='ls -a'
alias ld='ls .*'
alias gr='grep -r'

alias tar='gnutar'

#sane defaults
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -p'
alias vim='vim -p'
alias df='df -h'
alias du='du -ch'
alias mkdir='mkdir -p'

alias cmake='cmake -H. -Bbuild'

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
