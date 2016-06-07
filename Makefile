
dir_vimrc=vimrc
dir_snips=mysnippets

vimrc: ./vimrc/generage.sh
	@$(dir_vimrc)/generage.sh
	echo "Generage vimrc done"

mysnip:
	rsync -Pav $(dir_snips)/ ~/.vim/mysnippets/

install: ./install.sh
	@./install.sh
	echo "install done"

.PHONY: vimrc
