
dir_vimrc=vimrc
dir_snips=mysnippets

vimrc: ./vimrc/generate.sh
	@$(dir_vimrc)/generate.sh
	@echo "Generate vimrc done"

mysnip:
	rsync -Pav $(dir_snips)/ ~/.vim/mysnippets/

install: ./install.sh
	@./install.sh
	echo "install done"

.PHONY: vimrc
