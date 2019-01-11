# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color'
alias ls='ls -lhFA --color=always'
alias lss='ls -CFAh --color=always'
alias lls='ls -lhFA --color=always | less -r'

alias less='less -r'
alias mkdir='mkdir -pv'
alias rm='rm -Irf'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias l="ls -1tr * | tail -1 | awk '{print \$9}'"

PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/archie/.bin
export EDITOR=emp

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
