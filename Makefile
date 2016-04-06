
dir_vimrc=vimrc
dir_snips=mysnippets

vimrc: ./vimrc/generage.sh
	$(dir_vimrc)/generage.sh -f

mysnip:
	rsync -Pav $(dir_snips)/ ~/.vim/mysnippets/

.PHONY: vimrc mysnip
