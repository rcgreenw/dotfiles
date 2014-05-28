look_for_cmd=0

#Prints currently running command
print_cmd() {
  if [ ${look_for_cmd} = 1 ] ;then
    if [ "${BASH_COMMAND}" != 'print_host' ] ;then
      curhist='%h'
      cmdline=($(fc -l -n ${(%)curhist}))

      #For some commands, we want to know what the first argument is
      if [[ "${cmdline}" =~ ^(sudo|ssh|vi|vim|man|more|less)\  ]] ;then
        first=$(echo "${cmdline}" | awk '{print $1}')
        for i in ${cmdline} ;do
          if ! [[ "${i}" =~ ^-.*$ ]] && ! [[ "${i}" =~ ^${first}$ ]] ;then
            cmd="${first}[${i}]"
            break
          fi
        done

      #Skip a variable assignment
      elif [[ "${cmdline}" =~ ^[A-Z]*=.*$ ]] ;then
        cmd=$(echo ${cmdline} | awk '{print $2}')

      #For "normal" commands, just output the command
      else
        cmd=$(echo ${cmdline} | awk '{print $1}')
      fi
      echo ${cmd}
      look_for_cmd=0
    else
      return
    fi
  fi
}

#Different terminals use different characters to controll the title
case $TERM in 
   xterm*)
      precmd() { print -Pn "\e]0;%n@%m:%~\a" 1>&2 }
      preexec() {
         look_for_cmd=1
         cmd=`print_cmd`
         print -Pn "\e]0;%n@%m:${cmd}\a" 1>&2
      }
      ;;
   screen*|tmux*)
      precmd() { print -Pn "\033k%~\033\\" 1>&2 }
      preexec() {
         look_for_cmd=1
         cmd=`print_cmd`
         print -Pn "\033k${cmd}\033\\" 1>&2
      }
      ;;
esac
