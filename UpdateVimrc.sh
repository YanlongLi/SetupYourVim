#!/usr/bin/bash
__dir__="$(dirname "$0")"

ForWindows=false
if [[ "$1" == "ForWindows" ]]; then
  ForWindows=true
fi

VIMFILEDIR="$HOME/.vim"
ConfigDir="$__dir__/vimrc"
VundleConfigBegin="vundle_config_begin.vim"
VundleConfigEnd="vundle_config_end.vim"
OutputFile="$HOME/.vimrc"
DoInit=true
MySnippetsDir="$__dir__/mysnippets"

if [[ "$ForWindows" = true ]]; then
  PluginList=( $($__dir__/PluginList.sh -w) )
else
  PluginList=( $($__dir__/PluginList.sh -l) )
fi
ConfigList=( $($__dir__/PluginList.sh -c) )

if [[ "$ForWindows" = true ]]; then
  OutputFile="/tmp/_vimrc"
fi
if [[ -f "$OutputFile" ]]; then
  echo "Backup file: $OutputFile"
  mv -f "$OutputFile" "${OutputFile}.bak"
fi

echo "" > $OutputFile
cat "$ConfigDir/$VundleConfigBegin" >> $OutputFile
for plugin in ${PluginList[@]}; do
  echo "Plugin '$plugin'" >> $OutputFile
done
cat "$ConfigDir/$VundleConfigEnd" >> $OutputFile

for config in ${ConfigList[@]}; do
  if [[ -e $ConfigDir/$config ]]; then
    cat $ConfigDir/$config >> $OutputFile
  fi
done

if [[ "$ForWindows" = true ]]; then
  sed -i 's_~/\.vim/_$USERPROFILE/vimfiles/_g' $OutputFile
  sed -i 's_~/_$USERPROFILE/_g' $OutputFile
fi

if [[ "$ForWindows" != true ]] && [[ "$DoInit" = true ]]; then
  # Do Init for Linux Enviroment
  echo "DoInit vim plugins"
  if [[ ! -d $VIMFILEDIR/bundle/Vundle.vim/ ]]; then
    if [[ -d $VIMFILEDIR ]]; then
      echo "Backup $VIMFILEDIR/"
      if [[ -d ${VIMFILEDIR}-old ]]; then
        rm -rf ${VIMFILEDIR}-old
      fi
      mv $VIMFILEDIR ${VIMFILEDIR}-old
    fi
    mkdir -p "$VIMFILEDIR/bundle/"
    git clone https://github.com/VundleVim/Vundle.vim.git $VIMFILEDIR/bundle/Vundle.vim > /dev/null 2>&1
  fi
  vim -c ":PluginClean" -c ":PluginInstall" -c ":qa"
  # Post Init
  rsync -Paq "$__dir__/$MySnippetsDir"/ $VIMFILEDIR/mysnippets/
  rsync "$__dir__/editorconfig" $VIMFILEDIR/.editorconfig
  rsync "$__dir__/ycm_extra_conf.py" $VIMFILEDIR/.ycm_extra_conf.py
  vitalsnip="$VIMFILEDIR/bundle/neosnippet-snippets/neosnippets/vim/vital.snip"
  [[ -f $vitalsnip ]] && rm -f $vitalsnip
  # Build YCM
  echo "Command to Rebuild YCM:"
  echo "$HOME/.vim/bundle/YouCompleteMe/install.py --system-libclang --system-boost --clang-completer --tern-completer #--omnisharp-completer"
fi

