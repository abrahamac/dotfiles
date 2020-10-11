# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33m\]\w \[\033[47m\]$(echo $(__git_ps1 "%s") | cut -c1-16) \[\033[m\$ '

#home needs to be set to call this from root 
home_dir=/home/centos

source /etc/bash_completion.d/git 2> /dev/null
source ${home_dir}/git-prompt.sh
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

alias console="pry -r ./config/environment.rb"

export EDITOR='vi'
export HISTFILESIZE=10000
export HISTSIZE=10000

alias tml='tmux list-sessions'
alias tma='tmux attach -t $1'

alias be='bundle exec'

export LANG="en_US.utf8"

eval `dircolors ${home_dir}/.dir_colors`

complete -W "$(<${home_dir}/.ssh/config)" ssh

# Source global definitions
if [ -f ${home_dir}/.bashrc.local ]; then
	. ${home_dir}/.bashrc.local
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=~/.local/bin:$PATH
