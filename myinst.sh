#!/usr/bin/env bash


basedir=`pwd`

if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
  cd ~/.vim
  git init
  echo *.pyc >> .git/info/exclude
  echo myinst.sh >> .git/info/exclude
  touch vimrc
  touch README.md
  git add vimrc README.md
  git commit -m 'vimfile'
else
  cd ~/.vim
fi

declare -a lst=(
git@github.com:scrooloose/syntastic
:git@github.com:itchyny/calendar.vim
:git@github.com:Shougo/neocomplete.vim
:git@github.com:vim-scripts/OmniCppComplete
:git@github.com:vim-scripts/taglist.vim
:git@github.com:jeaye/color_coded.git
:git@github.com:mattn/gist-vim
git@github.com:vim-scripts/git-file.vim
git@github.com:vim-voom/VOoM
git@github.com:vimwiki/vimwiki
git@github.com:jiangmiao/auto-pairs
git@github.com:plasticboy/vim-markdown
git@github.com:greyblake/vim-preview
git@github.com:ap/vim-css-color
git@github.com:KabbAmine/vCoolor.vim
git@github.com:digitaltoad/vim-jade
git@github.com:cakebaker/scss-syntax.vim
git@github.com:dantezhu/authorinfo
git@github.com:tpope/vim-surround
git@github.com:scrooloose/nerdtree
git@github.com:pangloss/vim-javascript
git@github.com:alvan/vim-closetag
git@github.com:vim-scripts/bufkill.vim
git@github.com:majutsushi/tagbar
git@github.com:mattn/webapi-vim
git@github.com:lambdalisue/vim-gista.git
git@github.com:dhruvasagar/vim-table-mode
git@github.com:godlygeek/tabular
git@github.com:maksimr/vim-jsbeautify
git@github.com:scrooloose/nerdcommenter
git@github.com:gerw/vim-latex-suite
git@github.com:rdnetto/YCM-Generator
git@github.com:SirVer/ultisnips
git@github.com:honza/vim-snippets
git@github.com:Shougo/neosnippet-snippets
git@github.com:Chiel92/vim-autoformat
git@github.com:kchmck/vim-coffee-script
git@github.com:wavded/vim-stylus
git@github.com:posva/vim-vue
git@github.com:tpope/vim-fugitive
git@github.com:airblade/vim-gitgutter
git@github.com:kien/ctrlp.vim
git@github.com:easymotion/vim-easymotion
git@github.com:Valloric/YouCompleteMe
);

# ultisnips is snip engine
# vim-snippets and neoshippet-snippets for snippets files

for url in ${lst[@]}; do
  if [[ $url == :* ]] || [[ $url == "" ]]; then
    continue
  fi
  rname=${url##*/}
  rname=${rname%%.*}
  brname="master"
  echo "$rname $url"
  git remote -v | grep $rname > /dev/null
  if [ $? -eq 1 ]; then
    echo -e "new remote: \e[1;32m$rname\e[0m"
    git remote add $rname $url
  else
    echo "remote exist: \e[1:32m$rname\e[0m"
  fi
  if [ $rname == "YCM-Generator" ]; then
    brname=stable
  fi
  git pull --no-ff --no-edit --allow-unrelated-histories -s recursive -X theirs ${rname} $brname >/dev/null 2>&1
  if [ $? -eq 1 ]; then
    echo -e "\e[1;31merr: $rname\e[0m"
  fi
  git submodule update --init --recursive
done

echo "=================================="
echo "++++ init YouCompleteMe ++++++++++"
echo "YouCompleteMe include features of supertab, clang_complete"
echo "boost,clang,llvm,node,nodejs,npm"
echo "=================================="

git checkout YouCompleteMe/master
git submodule update --init --recursive
sed -i '1,1 s/\<python\>/python2/' install.py
./install.py --system-libclang --system-boost --clang-completer --tern-completer #--omnisharp-completer
git checkout install.py
git checkout master
# wget https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py -O ~/.ycm_extra_conf.py

echo "=================================="
echo "++++ init vim-jsbeautify +++++++++"
echo "=================================="
# git checkout vim-jsbeautify/master
# git submodule update --init --recursive
# git checkout master

echo "=================================="
echo "++++ vim-autoformat ++++++++++++++"
echo "formatter required, see https://github.com/Chiel92/vim-autoformat"
echo "clang-format"
echo "astyle"
echo "tidy"
echo "autopep8 for yapf, python package"
echo "js-beautify, nodejs package"
echo "remark, nodejs package"
echo "=================================="

# echo ==================================
# echo ++++ init color_coded
# echo ==================================
# 
# git checkout color_coded/master
# mkdir build && cd build/
# cmake .. -DCUSTOM_CLANG=1 -DLLVM_ROOT_PATH=/usr -DLLVM_LIB_PATH=/usr/lib -DLLVM_LIBS=/usr/lib/
# make && make install
# make clean && make clean_clang
# cd .. && rm -rf build/
# git checkout master
