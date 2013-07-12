export BASH_CONF="bashrc"
set -o vi

#alias mv='mv -i'
#alias cp='cp -i'
#alias rm='rm -i'
#alias vim='mvim -v'

alias ls='ls -F --color=auto'
alias ll='ls -ahl'

eval $( dircolors -b ~/.dir_colors )

export CLICOLOR=1
export GREP_OPTIONS="--color"

export RI="--format ansi -T"
#export PS1="\h:\W$ "
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export PS1="\[\e[0;36m\]\u@\h\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;33m\]\$(parse_git_branch)\[\e[m\]\[\033[35m\]\$\[\033[0m\] "
alias tmux="TERM=xterm-256color tmux"

mcd() { mkdir -p "$@" && cd "$@"; }
v() { vim -O "include/$@.hh" "src/$@.cc";  }
padoff() { synclient TouchpadOff=1; }
padon() { synclient TouchpadOff=0; }

alias mi='make -j5 && make -j5 install'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PERL_LOCAL_LIB_ROOT="/home/landers/perl5";
export PERL_MB_OPT="--install_base /home/landers/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/landers/perl5";
export PERL5LIB="/home/landers/perl5/lib/perl5/x86_64-linux-thread-multi:/home/landers/perl5/lib/perl5";
export PATH="/home/landers/perl5/bin:$PATH";
