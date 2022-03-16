ZSH=$HOME/.oh-my-zsh

export CLICOLOR=1
COLORTERM='xterm-256color'
ZSH_THEME="fishy"

export SSH_AUTH_SOCK=$HOME/.sekey/ssh-agent.ssh

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

plugins=(history-substring-search arch macos brew python rsync)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/texbin:/home/kmanville/.local/bin:/opt/homebrew/bin:.

PROMPT="%M:%2~: "

unsetopt correct_all

setopt interactivecomments

function get_outernet() {
	curl -s http://mbnet12.mitre.org/WPA/main.html | grep -oP '(<br><b>)\K([^<]*)'
}

function set_outernet() {
	key=$(get_outernet)
	key=${key// /\\ }
	sudo sed -i "s/Key=.*/Key=$key/" /etc/netctl/wlp2s0-OuterNET
}

function burncd() {
	mkisofs -V "`date`" -J -r $1 | cdrecord -v dev=/dev/sr0 -waiti -
}

function wifi_home() {
	sudo ip link set wlp2s0 down
	sudo netctl stop wlp2s0-9115
	sudo netctl start wlp2s0-9115
}

function disp_office() {
	xrandr --output eDP-1 --mode 2560x1440 --output DP-1 --auto --left-of eDP-1
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
	#export ftp_proxy=http://gatekeeper-w.mitre.org:80
	export no_proxy=.mitre.org localhost
}

function proxyoff() {
	unset http_proxy
	unset https_proxy
	unset no_proxy
}

alias pip='pip3'
alias python='python3'
alias ipython='python3 -m IPython'

alias chrome='chromium --proxy-pac-url="http://proxypac.mitre.org/sys/proxy.pac"'
alias chromium='chromium --proxy-pac-url="http://proxypac.mitre.org/sys/proxy.pac"'
#alias open='xdg-open'

alias ip='sudo ip'
alias wifi='sudo wifi-menu'
alias c='xclip -selection clipboard'
alias v='xclip -selection clipboard -o'
alias anyconnect='/opt/cisco/anyconnect/bin/vpnui'
alias valgrind='valgrind --suppressions=/home/kmanville/.valgrind.supp'

#sane defaults
export LSCOLORS="EHfxcxdxBxegecabagacad"
#alias ls='ls -Fh --color=auto'
alias ls='ls -Gh'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'
alias gr='grep -r'
alias vim='vim -p'
alias df='df -h'
alias du='du -ch'
alias mkdir='mkdir -p'
alias ssh='ssh -Y'

#common directories
alias ..='cd ..'
alias ../../='cd ../../'
alias ../../../='cd ../../../'

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

