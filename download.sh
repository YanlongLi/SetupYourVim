#!/bin/bash

lst_file= dl_dir= to_dir=

while getopts l:d:t opt; do
  case $opt in
    l)
      lst_file=$OPTARG
      ;;
    d)
      dl_dir=$OPTARG
      ;;
    t)
      to_dir=$OPTARG
      ;;
  esac
done

shift $((OPTIND - 1))

### check plugin list file
if [ -z $lst_file ]; then
  lst_file=list.txt
fi

if [ ! -f $lst_file ]; then
  echo 'input file not exists'
  exit
fi

if [ -z $dl_dir ]; then
  dl_dir='vim_plugin'
fi

if [ -z $to_dir ]; then
  to_dir='vimfiles'
fi


## create directory
if [ ! -d $dl_dir ]; then
  mkdir $dl_dir
fi

if [ ! -d $to_dir ]; then
  mkdir $to_dir
fi

echo '================================download directory' $dl_dir
echo '================================copy to directory' $to_dir

cd $dl_dir;
 
## clone plugin files
while IFS='' read -r line || [[ -n "$line" ]]; do
  git clone --recursive "${line}.git"
done < '../'$lst_file

echo '============dependency for vCoolor============='
echo 'zenity or yad'

echo '==========dependency for vim-jsbeautify======='
echo 'nodejs'

echo '==========dependency for clang_complete======='
echo 'clang'
echo 'libc++ libc++abi'

echo '===========other dependency===================='
echo 'curl wget'

echo 'remenber to execute :helptags'

## copy plugin files

exclude_file='exclude_file.txt'

for dir in `ls ./`; do
  rsync --cvs-exclude --exclude-from='../'$exclude_file -a ${dir}'/' '../'${to_dir}'/';
done

