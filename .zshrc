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

prompt='%? [%B%n@%m%b] %T %~>'

# start TMUX if not inside TMUX
if test -z "$TMUX"; then
   # only for first shell
   if [[ $SHLVL == 1 ]]; then
      #if no session is started, start a new session
      which tmux 2>&1 >/dev/null && tmux attach -t $HOSTNAME || tmux new-session -s $HOSTNAME
   fi

# TMUX already running
else
   # Remove time from prompt, tmux status line has time
   prompt='%? [%B%n@%m%b] %~>'
   # Run w
   w
fi

#unset autologout
#set color
#set colorcat
#set backslash_quote
#set symlinks=ignore

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey '^[[1;5C' forward-word
bindkey '^[OC' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[OD' backward-word
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

foreach src (`echo ~/.zshrc.d/*`)
   source $src
end
