# Setup Your Vim

This repo is used to initialize my vim environment.

Plugins I used can be found in script file [PluginList.sh](./PluginList.sh)

## Prerequisite

| Packages               | ~                                           |
| ---------------------- | ------------------------------------------- |
| git                    | used to download plugins                    |
| python-dev             | some plugins need python                    |
| python3-dev            | some plugins need python                    |
| libboost-all-dev       | used by [YouCompleteMe]()                   |
| clang-format           | used by [YouCompleteMe]()                   |
| cmake                  | used by [YouCompleteMe]()                   |
| clang                  | used by [YouCompleteMe]()                   |
| boost                  | used by [YouCompleteMe]()                   |
| llvm                   | used by [YouCompleteMe]()                   |
| mono-xbuild mono-dmcs  | if you want to [YouCompleteMe]() support C# |
| node nodejs-legacy npm |                                             |
| astyle                 | used by [vim-autoformat]()                  |
| tidy                   | used by [vim-autoformat]()                  |
| openssh-client         |                                             |


| python package |
| -------------- |
| autopep8       |
| yapf           |

| nodejs package |
| -------------- |
| js-beautify    |
| remark         |

Setup git
```
git config --global user.name "<your name>"
git config --global user.email "<your email>"
```
## Install

### Use Vundle

### [UpdateVimrc.sh](./UpdateVimrc.sh)
Used to initialize file `~/.vimrc` and `~/.vim/` directory

```
$> ./UpdateVimrc.sh # Under linux
```
This will automatically install vundle and install all the plugins list in [PluginList.sh](./PluginList.sh)

If you want to generate Vimrc for windows usage
```
$> ./UpdateVimrc.sh ForWindows
```
You need to manually initilaize the [vundle](https://github.com/VundleVim/Vundle.vim)

### [PluginList.sh](./PluginList.sh)

This file is used by [UpdateVimrc.sh](./UpdateVimrc.sh)

```
$ ./PluginList.sh -h
Usage :  ./PluginList.sh [options] [--]

    Options:
    -h|help       Display this message
    -w|windows    Plugin list used in Windows
    -l|linux	  Plugin list used in linux
    -c|config	  config file list in repo's vimrc directory
    -v|version    Display script version"
```

### Don't use Vundle (Need to setup ssh for github)

In this mode, I just merge all plugin files in to `~/.vim/`. I first save each plugin in a seperate git remote, then merge them all into master branch.
```
$> make install # make sure no error occurs
$> make vimrc # then edit ~/.vimrc and do some personal config
```

## Included Plugins

*TODO*: list an essential set of plugins I need.

| -                   | -                 | -                       | -                        |
| ------------------- | ----------------- | ----------------------- | ------------------------ |
| [VOoM]()            |                   | [vimwiki]()             |                          |
| [auto-pairs]()      |                   | [vim-markdown]()        |                          |
| [vim-preview]()     | Markdown preview? |                         |                          |
| [authorinfo]()      |                   |                         |                          |
| [vim-surround]()    |                   | [nerdtree]()            |                          |
| [vim-javascript]()  |                   | [vim-closetag]()        |                          |
| [bufkill.vim]()     |                   | [tagbar]()              |                          |
| [webapi-vim]()      |                   | [gist-vim]()            |                          |
| [vim-table-mode]()  |                   | [tabular]()             |                          |
| [vim-jsbeautify]()  |                   | [nerdcommenter]()       | Used to comment code     |
| [vim-latex-suite]() |                   | [YouCompleteMe]()       | Used for code completion |
| [YCM-Generator]()   |                   | [ultisnips]()           |                          |
| [vim-snippets]()    |                   | [neosnippet-snippets]() |                          |
| [vim-autoformat]()  |                   | [vim-coffee-script]()   |                          |
| [vim-stylus]()      |                   | [vim-vue]()             |                          |
| [scss-syntax.vim]() |                   | [vCoolor.vim]()         |                          |
| [vim-jade]()        |                   | [vim-css-color]()       |                          |

[VOoM]: https://github.com/vim-voom/VOoM
[vimwiki]: https://github.com/vimwiki/vimwiki
[auto-pairs]: https://github.com/jiangmiao/auto-pairs
[vim-markdown]: https://github.com/plasticboy/vim-markdown
[vim-preview]: https://github.com/greyblake/vim-preview
[vim-css-color]: https://github.com/ap/vim-css-color
[vCoolor.vim]: https://github.com/KabbAmine/vCoolor.vim
[vim-jade]: https://github.com/digitaltoad/vim-jade
[scss-syntax.vim]: https://github.com/cakebaker/scss-syntax.vim
[authorinfo]: https://github.com/dantezhu/authorinfo
[vim-surround]: https://github.com/tpope/vim-surround
[nerdtree]: https://github.com/scrooloose/nerdtree
[vim-javascript]: https://github.com/pangloss/vim-javascript
[vim-closetag]: https://github.com/alvan/vim-closetag
[bufkill.vim]: https://github.com/vim-scripts/bufkill.vim
[tagbar]: https://github.com/majutsushi/tagbar
[webapi-vim]: https://github.com/mattn/webapi-vim
[gist-vim]: https://github.com/mattn/gist-vim
[vim-table-mode]: https://github.com/dhruvasagar/vim-table-mode
[tabular]: https://github.com/godlygeek/tabular
[vim-jsbeautify]: https://github.com/maksimr/vim-jsbeautify
[nerdcommenter]: https://github.com/scrooloose/nerdcommenter
[vim-latex-suite]: https://github.com/gerw/vim-latex-suite
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[YCM-Generator]: https://github.com/rdnetto/YCM-Generator
[ultisnips]: https://github.com/SirVer/ultisnips
[vim-snippets]: https://github.com/honza/vim-snippets
[neosnippet-snippets]: https://github.com/Shougo/neosnippet-snippets
[vim-autoformat]: https://github.com/Chiel92/vim-autoformat
[vim-coffee-script]: https://github.com/kchmck/vim-coffee-script
[vim-stylus]: https://github.com/wavded/vim-stylus
[vim-vue]: https://github.com/posva/vim-vue
