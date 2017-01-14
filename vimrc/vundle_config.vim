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
Plugin 'jiangmiao/auto-pairs'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'alvan/vim-closetag'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'majutsushi/tagbar'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/AuthorInfo'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'Shougo/neosnippet-snippets'

call vundle#end()            " required
filetype plugin indent on    " required, To ignore plugin indent changes, instead use: filetype plugin on

" Put your non-Plugin stuff after this line