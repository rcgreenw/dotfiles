# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/rcgreenw/.zshrc'

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

PATH=~/bin:${PATH}:/sbin:/usr/sbin:.
LS_COLORS='di=36'
PAGER='less'
READNULLCMD=less
MAIL=~/Maildir/
CVS_RSH=ssh
LESS='-n -s -j4 -R'
LC_COLLATE=C
GREP_COLORS="ms=01;31:mc=01;31:sl=33:cx=:fn=35:ln=32:bn=32:se=36"

prompt='[%B%m%b] %n %T %D{%a} %~>'

#unset autologout
#set color
#set colorcat
#set backslash_quote
#set symlinks=ignore

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[1;5C' forward-word
bindkey '^[OC' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[OD' backward-word
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

foreach src (`echo ~/.zshrc.d/*`)
   source $src
end

