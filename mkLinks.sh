#! /bin/bash

cd ~/
for file in `cat .gw/dotfiles/files` ; do
   dir=`dirname $file`
   if [[ ! -d $dir ]] ; then
      mkdir -p $dir
   fi
   if [[ ! -L $file ]] ; then
      ln -sf ~/.gw/dotfiles/$file $file
   fi 
done
