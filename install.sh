#!/usr/bin/env bash

./myinst.sh

rsync -Pav $(dir_snips)/ ~/.vim/mysnippets/
