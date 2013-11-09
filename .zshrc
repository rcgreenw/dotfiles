# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/strobert/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=2000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

setopt autocd cdablevars pushdsilent pushdtohome
setopt extendedglob
setopt appendhistory extendedhistory histfcntllock histverify
setopt ignoreeof printexitvalue
setopt cbases cprecedences

PATH=/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin:/home/strobert/bin:/usr/X11R6/bin
LS_COLORS='di=36'
PAGER='less'
READNULLCMD=less
MAIL=~/Maildir/
CVS_RSH=ssh
LESS='-n -s -j4 -R'
LC_COLLATE=C

prompt='[%B%m%b] %n %T %D{%a} %~>'

#unset autologout
#set color
#set colorcat
#set backslash_quote
#set symlinks=ignore

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

alias ls='ls --color -F'
alias ll='ls -l'
alias md='mkdir'
alias rd='rmdir'
alias history='history -i -30'
alias ci='ci -d -M'
alias co='co -M'
alias locks='cvs editors | cut -f1-3 | expand -65,85'
alias make='make --no-print-directory'
alias ssh='ssh -P'
alias rwho='rwho -a'
alias ruptime='ruptime -a'
alias rup='ruptime'
alias pd='pushd'
alias pod='popd'
alias tra='traceroute -I'
alias ping='ping -n'
alias ycd='cd ~/devel/ysl'
alias rssh='ssh `rolefind "$@"`'
alias printenv='builtin printenv | sort'
alias dlook='grep "$@" /usr/share/dict/words'
alias mkpasswd='mkpasswd -s 0'
alias icd='cd /install/kickstart/strobe'
alias bcd='cd /usr/build/strobert/usr/src/redhat'
alias pcd='cd /etc/puppet/modules/strobenet'
alias od='od -A x -t x1z'
alias grep='grep -E'
alias cf='fold -w1 "$@" | sort | uniq -c | sort -rn'
alias reload='rndc reload "$@" IN internal; sleep 1; rndc reload "$@" IN external'
alias wcd='pushd /usr/local/wfcom/www.wfcommittee.com'
alias dcd='pushd /usr/local/wfcom/dev.wfcommittee.com'
alias vzl="sudo vzlist -a -o ctid,hostname,status,ostemplate,numproc,diskspace,diskspace.s,diskinodes,diskinodes.s | perl -p -e 's/\.internal\.strobe\.net//' | tr -s ' ' | tr ' ' '\t' | expand -t 1,2,7,17,26,44,50,60,70,78"
alias from=from.pl
