" =============================================================================
"      FileName: base_config.vim
"          Desc: 
"      HomePage: 
" =============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required

"echo 'gui:' has("gui_running") 'term:' &t_Co+0
set t_Co=256 
set mouse=c       											        " no mouse to command line mode ====
set hlsearch    											        " highlight for search 

set dictionary+=~/.dictionary,~/.mail_aliases   " Dictionary
set backupdir=~/.vim/backup,/tmp                " set backup dir
set tags+=./tags;/                              " Upward tag search
set printoptions+=syntax:y                      " Use syntax hilighting when printing

set grepprg=grep\ -nH\ $*                       " program used for :grep command
set shellslash
set autoindent

set ts=2
set sw=2
set expandtab
set showcmd
set wildmenu
set lazyredraw
set foldmethod=indent
set foldenable
let mapleader=","

syntax on

filetype plugin on
filetype indent on

" disable errorbells
set vb " visualbell
highlight Search ctermbg=darkgrey

autocmd FileType jade setlocal noexpandtab
autocmd FileType vue setlocal noexpandtab
autocmd FileType make setlocal noexpandtab
autocmd FileType coffee setlocal noexpandtab
autocmd FileType python setlocal noexpandtab
autocmd FileType python setlocal ts=2

