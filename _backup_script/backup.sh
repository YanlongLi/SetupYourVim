#!/bin/bash

vimrc_backup_path='vimrc'
vimrc_path=$HOME/.vimrc
rsync -v $vimrc_path $vimrc_backup_path
