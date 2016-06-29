# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33m\]\w\[\033[m\]\$ "

source /etc/bash_completion.d/git 2> /dev/null
source ~/git-prompt.sh
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

alias console="pry -r ./config/environment.rb"

export EDITOR='vim'

alias tml='tmux list-sessions'
alias tma='tmux attach -t $1'

alias be='bundle exec'

export LANG="en_US:en"

eval `dircolors ~/.dir_colors`

# Source global definitions
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi
