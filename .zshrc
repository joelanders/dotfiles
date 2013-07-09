stty pass8 && bindkey -mv 2>/dev/null
bindkey -v

function precmd {
    VIMODE=$'%{\e[0;32m%}[i]%{\e[0m%}'
}

function zle-keymap-select {
    NCOLOR=$'%{\e[1;33m%}'
    ICOLOR=$'%{\e[0;32m%}'
    ENDCOL=$'%{\e[0m%}'
    VIMODE="${${KEYMAP/vicmd/${NCOLOR}[n]${ENDCOL}}/(main|viins)/${ICOLOR}[i]${ENDCOL}}"
    zle reset-prompt
}

zle -N zle-keymap-select

setopt prompt_subst

PROMPT=$'%{\e[0;36m%}\\
l@rmbp \\
%{\e[0m%}\\
%{\e[0;34m%}\\
${PWD/#$HOME/~} \\
%{\e[0m%}\\
${VIMODE} \\
%{\e[0;35m%}\\
$ \\
%{\e[0m%}'

autoload -U select-word-style
select-word-style bash

bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^?' backward-delete-char
bindkey -M viins 'jk' vi-cmd-mode

bindkey -s ',gs' '^qgit status\n'
bindkey -s ',gb' '^qgit branch\n'
bindkey -s '\ej1' 'jkk\n'
#bindkey -s 'j2' 'jkkk\n'
#bindkey -s 'ja' 'jkk0cw'
#bindkey -s 'je' 'jkkBcW'

#alias ls='ls -F --color=auto'
alias ll='ls -ahl'

export CLICOLOR=1
export GREP_OPTIONS="--color"
export RI="--format ansi -T"
#alias tmux="TERM=xterm-256color tmux"
mcd() { mkdir -p "$@" && cd "$@"; }
cdu()      { cd .. }
cduu()     { cd ../.. }
cduuu()    { cd ../../.. }
cduuuu()   { cd ../../../.. }
cduuuuu()  { cd ../../../../.. }
cduuuuuu() { cd ../../../../../.. }
#v() { vim -O "include/$@.hh" "src/$@.cc";  }
#alias mi='make -j5 && make -j5 install'
alias gs='git status'
alias gb='git branch'
alias gbc='git checkout -b'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gcom='git checkout master'
alias gmom='git merge origin/master'
alias gsu='git submodule update'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD~1 HEAD'
alias gf='git fetch'
alias gl='git log'
alias gl1='git log --graph --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(blue)%s%C(reset) %C(bold blue)— %an%C(reset)%C(bold yellow)%d%C(reset)" --abbrev-commit --date=relative'
alias gl2='git log --graph --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(blue)%s%C(reset) %C(bold blue)— %an%C(reset)" --abbrev-commit'
PATH=$PATH:$HOME/.rvm/bin:/usr/local/sbin:/Users/joelanders/code/tools/bin # Add RVM to PATH for scripting

alias sc='script/satisfaction'

HISTSIZE=400
HISTFILE=~/.zsh_history
SAVEHIST=400
alias ss='cd ~/code/satisfaction'
alias pack='ack --pager="less -r"'
alias t='tree'
alias v='vim'
alias p='ps aux'
alias j='jobs'
alias f='fg'
alias e='emacsclient -n'

alias bes='bundle exec spec'
alias ber='bundle exec rake'
alias be='bundle exec'

source "/usr/local/opt/git/etc/bash_completion.d/git-completion.bash"
