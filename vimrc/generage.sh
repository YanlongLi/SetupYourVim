#!/usr/bin/env bash

__ScriptVersion="1.0"

output=~/.vimrc
backup=~/.vimrc-bak

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
  echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version"

}    # ----------  end of function usage  ----------

function generate() {
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
    YouCompleteMe.vim
    nerdcommenter.vim
    vim-latex-suite.vim
    vim-jsbeautify.vim
    vim-autoformat.vim
    vim-coffee-script.vim
  );
  local dir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
  echo "" > $output
  for file in ${lst[@]}; do
    if [ -e $dir/$file ]; then
      cat $dir/$file >> $output
    fi
  done
  # sed -i '/^$/d' $output
}

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hv" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

if [ -e $output ]; then
  mv $output $backup
fi

generate;
