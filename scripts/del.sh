#!/bin/bash

if [ -z $1 ]; then
echo 'del : Fichier ou répertoire non spécifié'
exit 1
fi

timestamp=`date '+%s'`

while [ $# -ge 1 ]; do
file=`echo $1 | sed 's/\/$//'`

if [ ! -e $file ]; then
echo "del : Fichier ou répertoire '$file' introuvable"
else
echo -n "del : Etes-vous sûr de vouloir supprimer '$file' ? [y/n] "

read confirm

if [ -z $confirm ]; then
confirm='n'
fi

if [ $confirm == 'y' ]; then
echo "Suppression du fichier ou répertoire '$file' ..."

file_name=`basename $file`

mv $file ~/.trash/$file_name-$timestamp
fi
fi

shift
done

for i in `ls -1 ~/.trash/` ; do
taille=`echo ${#i}`
deltime=${i:$taille-10:10}
diff=`expr $timestamp - $deltime`

if [ $diff -gt 2592000 ]; then
rm -rf ~/.trash/$i
fi
done

exit 0