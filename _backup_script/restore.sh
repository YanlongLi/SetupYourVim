#!/bin/bash

vimrc_backup_path='vimrc'
vimrc_path=$HOME/.vimrc

if [[ -e $vimrc_backup_path ]]
then
	rsync -v $vimrc_backup_path $HOME/.vimrc
else
	echo "backup file $(realpath $vimrc_backup_path) not exist "
fi

