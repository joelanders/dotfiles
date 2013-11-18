stty pass8 2>/dev/null

setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

PROMPT=$'%{\e[0;36m%}\\
l@rmbp \\
%{\e[0m%}\\
%{\e[0;34m%}\\
${PWD/#$HOME/~} \\
%{\e[0m%}\\
${vcs_info_msg_0_}\\
%{\e[0;35m%}\\
$ \\
%{\e[0m%}'

autoload -U select-word-style
select-word-style bash

#bindkey -s ',gs' '^qgit status\n'
#bindkey -s ',gb' '^qgit branch\n'
#bindkey -s '\ej1' 'jkk\n'
#bindkey -s 'j2' 'jkkk\n'
#bindkey -s 'ja' 'jkk0cw'
#bindkey -s 'je' 'jkkBcW'

#alias ls='ls -F --color=auto'
alias ll='ls -ahl'
#different mechanisms to do basically the same thing
#(this one lists hidden files; the next lists directories)
alias lsh="ls -a | egrep '^\.'"
# list directories
lsd() {for dir in */; do echo $dir; done}

# list git directories and non-git directories
lsgd() {for dir in */; do if [ -d $dir/.git ]; then echo $dir; fi; done}
# list non-git directories... (ugly repetition)
lsngd() {for dir in */; do if [ ! -d $dir/.git ]; then echo $dir; fi; done}
# do a git fetch in each git directory
# lots of nasty output. sometimes rvm will ask about .rvmrc...
fetchall() {for d in `lsgd`; do (cd $d && echo "### $d ###\n" && git fetch); done}

export CLICOLOR=1
export GREP_OPTIONS="--color"
export RI="--format ansi -T"
#alias tmux="TERM=xterm-256color tmux"
mcd() { mkdir -p "$@" && cd "$@"; }
cdu()      { cd ../$@ }
cduu()     { cd ../../$@ }
cduuu()    { cd ../../../$@ }
cduuuu()   { cd ../../../../$@ }
cduuuuu()  { cd ../../../../../$@ }
cduuuuuu() { cd ../../../../../../$@ }
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
alias gff='git merge --ff-only'
alias gffom='git merge --ff-only origin/master'
alias gl='git log'
alias glo='git log --oneline'
alias gl1='git log --graph --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(blue)%s%C(reset) %C(bold blue)— %an%C(reset)%C(bold yellow)%d%C(reset)" --abbrev-commit --date=relative'
alias gl2='git log --graph --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n""          %C(blue)%s%C(reset) %C(bold blue)— %an%C(reset)" --abbrev-commit'

alias ick='ack -i'
alias wack='ack -w'
alias wick='ack -iw'

PATH=$PATH:$HOME/.rvm/bin:/usr/local/sbin:/Users/joelanders/code/tools/bin # Add RVM to PATH for scripting

alias sc='script/satisfaction'

HISTSIZE=400
HISTFILE=~/.zsh_history
SAVEHIST=400
alias ss='cd ~/code/satisfaction'
alias pack='ack --pager="less -r"'
alias t='tree'
alias v='vim'
alias p='ps aux | grep '
alias j='jobs'
alias f='fg'
alias e='emacsclient -n'

alias bes='bundle exec spec'
alias ber='bundle exec rake'
alias be='bundle exec'

# nasty... (and figure out why the zsh version doesn't work)
if     [ -e "/usr/local/opt/git/etc/bash_completion.d/git-completion.bash" ]; then
    source  "/usr/local/opt/git/etc/bash_completion.d/git-completion.bash"
elif  [ -e "/usr/share/git/completion/git-completion.bash" ]; then
    source "/usr/share/git/completion/git-completion.bash" 2>/dev/null
fi

export SATISFACTION_TOOLS=/Users/joelanders/code/tools

# experimental
function find-selecta {
    BUFFER+=" $(find . -not -path './.git*' | selecta)"
    zle accept-line
}
zle -N find-selecta
bindkey '^t' find-selecta

alias epoch='date +"%s"'
