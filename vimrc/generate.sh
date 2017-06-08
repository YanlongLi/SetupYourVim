#!/usr/bin/bash

__ScriptVersion="1.0"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
  echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -w|vundle     Use Vundle
    -v|version    Display script version"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hvw" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

  w|vundle   ) useVundle="true" ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

declare -a lst=(
  base_config.vim
  status_line.vim
  fcitx-fix.vim
  closetag.vim
  vim-css-color.vim
  vCoolor.vim
  authorinfo.vim
  vim-table-mode.vim
  vimwiki.vim
  neocomplete.vim
  YouCompleteMe.vim
  nerdtree.vim
  nerdcommenter.vim
  vim-latex-suite.vim
  vim-jsbeautify.vim
  vim-autoformat.vim
  vim-coffee-script.vim
  syntastic.vim
  indentline.vim
);

filedir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
vundlefile="vundle_config.vim"

output=~/.vimrc
backup=~/.vimrc-bak
if [ ! -z ${useVundle} ]; then
  output=~/_vimrc
  backup=~/_vimrc-bak
fi


if [ -e $output ]; then
  mv $output $backup
fi

echo "" > $output

if [ ! -z ${useVundle} ]; then
  echo "Generate Config with Vundle"
  cat $filedir/$vundlefile >> $output
fi

for file in ${lst[@]}; do
  if [ -e $filedir/$file ]; then
    cat $filedir/$file >> $output
  fi
done

if [ ! -z ${useVundle} ]; then
  sed -i 's_~/\.vim/_$USERPROFILE/vimfiles/_g' $output
  sed -i 's_~/_$USERPROFILE/_g' $output
fi
