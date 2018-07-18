#! /bin/bash

SCRIPTPATH=$(dirname `which ${BASH_SOURCE[0]}`)
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ~/
for file in `grep -v ^# $SCRIPTPATH/files` ; do
   if [[ -a $SCRIPTPATH/$file ]] ; then
      # Only proceed if source file exists
      dir=`dirname $file`
      if [[ ! -d $dir ]] ; then
         mkdir -p $dir
      fi
      if [[ ! -L $file ]] ; then
         # Link doesn't exist, do something
         if [[ -f $file ]] ; then
            # Backup then link
            echo Backup up $file to $SCRIPTPATH/$file.mkLinksBackup
            mv $file $SCRIPTPATH/$file.mkLinksBackup &&
            ln -sf $SCRIPTPATH/$file $file
         elif [[ -a $file ]] ; then
            # Unknown
            echo Unknown file in the way: $file
         else
            # Link
            ln -sf $SCRIPTPATH/$file $file
         fi
      fi
   else
      # No source file
      echo File missing: $file
   fi
done
