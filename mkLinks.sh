#! /bin/bash

SCRIPTPATH=$(dirname `which ${BASH_SOURCE[0]}`)
cd ~/
for file in `grep -v ^# $SCRIPTPATH/files` ; do
   if [[ -a $file ]] ; then
      # Only proceed if source file exists
      dir=`dirname $file`
      if [[ ! -d $dir ]] ; then
         mkdir -p $dir
      fi
      if [[ -L $file ]] ; then
         # Skip
         echo Skipping $file
      elif [[ -f $file ]] ; then
         # Backup then link
         mv $file $SCRIPTPATH/$file.mkLinksBackup
         ln -sf $SCRIPTPATH/$file $file
      elif [[ ! -a $file ]] ; then
         # Link
         ln -sf $SCRIPTPATH/$file $file
      else
         # Unknown
         echo Unknown file in the way: $file
      fi
   else
      # No source file
      echo File missing: $file
   fi
done
