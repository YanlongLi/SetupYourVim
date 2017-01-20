" =============================================================================
"      FileName: Config for Vundle.vim
"          Desc: 
"      HomePage: 
"              Brief help
"              :PluginList       - lists configured plugins
"              :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"              :PluginSearch foo - searches for foo; append `!` to refresh local cache
"              :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"              see :h vundle for more details or wiki for FAQ
" =============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=$HOME/vimfiles/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin('$USERPROFILE/vimfiles/bundle') " call vundle#begin(), alternatively, pass a path where Vundle should install plugins

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
" The following are examples of different formats supported.
" plugin on GitHub repo

Plugin 'scrooloose/syntastic'
" Plugin 'itchyny/calendar.vim'
" Plugin 'vim-scripts/OmniCppComplete'
" Plugin 'vim-scripts/taglist.vim'
" Plugin 'jeaye/color_coded.git'
" Plugin 'mattn/gist-vim'

" Plugin 'vim-scripts/git-file.vim'
" Plugin 'vim-voom/VOoM'
Plugin 'vimwiki/vimwiki'
Plugin 'jiangmiao/auto-pairs'
Plugin 'plasticboy/vim-markdown'
Plugin 'greyblake/vim-preview'
" Plugin 'ap/vim-css-color'
" Plugin 'KabbAmine/vCoolor.vim'
" Plugin 'digitaltoad/vim-jade'
" Plugin 'cakebaker/scss-syntax.vim'
Plugin 'dantezhu/authorinfo'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'alvan/vim-closetag'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'mattn/webapi-vim'
" Plugin 'lambdalisue/vim-gista.git'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'gerw/vim-latex-suite'
" Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Chiel92/vim-autoformat'
Plugin 'kchmck/vim-coffee-script'
Plugin 'wavded/vim-stylus'
" Plugin 'posva/vim-vue'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required, To ignore plugin indent changes, instead use: filetype plugin on

" Put your non-Plugin stuff after this line
