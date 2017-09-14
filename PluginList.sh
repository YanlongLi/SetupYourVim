#!/usr/bin/bash

ForWindows=false
ForLinux=true
ForConfig=false

__ScriptVersion="version"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
  echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -w|windows    Plugin list used in Windows
    -l|linux	  Plugin list used in linux
    -c|config	  config file list in repo's vimrc directory
    -v|version    Display script version"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hwlcv" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  w|windows ) ForWindows=true;;

  l|linux   ) ForLinux=true;;

  c|config  ) ForConfig=true;;

  v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

declare -a ListCandidate=(
itchyny/calendar.vim
vim-scripts/OmniCppComplete
vim-scripts/taglist.vim
jeaye/color_coded.git
mattn/gist-vim
)

declare -a ListBoth=(
scrooloose/syntastic
vimwiki/vimwiki
jiangmiao/auto-pairs
plasticboy/vim-markdown
greyblake/vim-preview
dantezhu/authorinfo
tpope/vim-surround
scrooloose/nerdtree
jistr/vim-nerdtree-tabs
pangloss/vim-javascript
alvan/vim-closetag
vim-scripts/bufkill.vim
majutsushi/tagbar
dhruvasagar/vim-table-mode
godlygeek/tabular
maksimr/vim-jsbeautify
scrooloose/nerdcommenter
SirVer/ultisnips
honza/vim-snippets
Shougo/neosnippet-snippets
Chiel92/vim-autoformat
kchmck/vim-coffee-script
wavded/vim-stylus
tpope/vim-fugitive
airblade/vim-gitgutter
kien/ctrlp.vim
easymotion/vim-easymotion
Yggdroot/indentLine
bronson/vim-trailing-whitespace
bonsaiben/bootstrap-snippets
jvanja/vim-bootstrap4-snippets
Valloric/YouCompleteMe
ternjs/tern_for_vim
reinh/jquery-autocomplete
)

declare -a ListLinux=(
vim-scripts/git-file.vim
vim-voom/VOoM
ap/vim-css-color
KabbAmine/vCoolor.vim
digitaltoad/vim-jade
cakebaker/scss-syntax.vim
mattn/webapi-vim
lambdalisue/vim-gista.git
gerw/vim-latex-suite
rdnetto/YCM-Generator
posva/vim-vue
)

declare -a ListWindows=(
Shougo/neocomplete.vim
vim-airline/vim-airline
vim-airline/vim-airline-themes
sheerun/vim-polyglot
MarcWeber/vim-addon-mw-utils
tomtom/tlib_vim
garbas/vim-snipmate
)

declare -a ListConfig=(
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
  vim-nerdtree-tabs.vim
  nerdcommenter.vim
  vim-latex-suite.vim
  vim-jsbeautify.vim
  vim-autoformat.vim
  vim-coffee-script.vim
  syntastic.vim
  indentline.vim
);

if [[ "$ForConfig" = true ]]; then
  for config in ${ListConfig[@]}; do
    echo "$config"
  done
else
  if [[ "$ForWindows" = true ]]; then
    ListBoth+=( "${ListWindows[@]}" )
  else
    ListBoth+=( "${ListLinux[@]}" )
  fi
  for plugin in ${ListBoth[@]}; do
    echo "$plugin"
    # echo "Plugin '${plugin}'"
  done
fi

