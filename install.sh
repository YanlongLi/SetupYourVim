#!/usr/bin/env bash

dir_snips=mysnippets

./myinst.sh

rsync -Paq $dir_snips/ ~/.vim/mysnippets/
rsync ./editorconfig ~/.vim/.editorconfig
rsync ./ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
rm -f ~/.vim/neosnippets/vim/vital.snip
