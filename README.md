
# vim_plugin_installer

## plugins included

- [VOoM](https://github.com/vim-voom/VOoM)
- [vimwiki](https://github.com/vimwiki/vimwiki)
- [auto-pairs](https://github.com/jiangmiao/auto-pairs)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [vim-preview](https://github.com/greyblake/vim-preview)
- [vim-css-color](https://github.com/ap/vim-css-color)
- [vCoolor.vim](https://github.com/KabbAmine/vCoolor.vim)
- [vim-jade](https://github.com/digitaltoad/vim-jade)
- [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim)
- [authorinfo](https://github.com/dantezhu/authorinfo)
- [vim-surround](https://github.com/tpope/vim-surround)
- [nerdtree](https://github.com/scrooloose/nerdtree)
- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [vim-closetag](https://github.com/alvan/vim-closetag)
- [bufkill.vim](https://github.com/vim-scripts/bufkill.vim)
- [tagbar](https://github.com/majutsushi/tagbar)
- [webapi-vim](https://github.com/mattn/webapi-vim)
- [gist-vim](https://github.com/mattn/gist-vim)
- [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-jsbeautify](https://github.com/maksimr/vim-jsbeautify)
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
- [vim-latex-suite](https://github.com/gerw/vim-latex-suite)
- [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [YCM-Generator](https://github.com/rdnetto/YCM-Generator)
- [ultisnips](https://github.com/SirVer/ultisnips)
- [vim-snippets](https://github.com/honza/vim-snippets)
- [neosnippet-snippets](https://github.com/Shougo/neosnippet-snippets)
- [vim-autoformat](https://github.com/Chiel92/vim-autoformat)
- [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
- [vim-stylus](https://github.com/wavded/vim-stylus)
- [vim-vue](https://github.com/posva/vim-vue)

## install

### packages required for ubuntu

- cmake
- clang
- boost
- llvm
- python-dev
- python3-dev
- libboost-all-dev
- openssh-client
- mono-xbuild
- mono-dmcs
- node
- nodejs-legacy
- npm
- clang-format
- astyle
- tidy
- python package
  - autopep8
  - yapf
- nodejs package
  - js-beautify
  - remark

### packages required for Arch

### to install

#### 1. setup git
```
git config --global user.name "<your name>"
git config --global user.email "<your email>"
```
#### 2. install plugins
```
make install ## make sure no error occurs
```
#### 3. generate vimrc file
```
make vimrc
```
edit `~/.vimrc` and do some personal config
