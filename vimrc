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

" ======================================== auto-pairs ===========================================
" let g:AutoPairsFlyMode = 1

" ======================================== status lines  ===========================================
set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P
set laststatus=2  								              " Always show status bar
" file name completion with suffixes will be ignored
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,CVS/,tags 

" ======================================== option for latex-suit ===========================================
" latex-suit: user \lx command to change compiler to xelatex
" http://blog.csdn.net/guanggy/article/details/4790111
" http://tex.stackexchange.com/questions/150770/how-to-make-vim-short-key-for-xelatex-and-pdflatex-both
let g:Tex_Flavor = "pdflatex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_IgnoreLevel=9
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
function SetXeTex()
		let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
endfunction
map <Leader>lx :<C-U>call SetXeTex()<CR>

" ======================================== auto change fcitx betweed Chinese and English Mode ===========================================
let g:input_toggle = 1
function! Fcitx2en()
	let s:input_status = system("fcitx-remote")
	if s:input_status == 2
		let g:input_toggle = 1
		let l:a = system("fcitx-remote -c")
	endif
endfunction

function! Fcitx2zh()
	let s:input_status = system("fcitx-remote")
	if s:input_status != 2 && g:input_toggle == 1
		let l:a = system("fcitx-remote -o")
		let g:input_toggle = 0
	endif
endfunction

set ttimeoutlen=150
autocmd InsertLeave * call Fcitx2en()  					" leave Insert mode
" autocmd InsertEnter * call Fcitx2zh() 				" enter Insert mode

" ======================================== I couldn't remmenber ===========================================

" au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


" ======================================== Table-mode ===========================================
let g:table_mode_corner = '+'           " Use this option to define the table corner character
let g:table_mode_delimiter = ' '        " Use this option to define the delimiter which used by
let g:table_mode_separator = '|'
let g:table_mode_fillchar = '-'
let g:table_mode_corner_corner = '+'
let g:table_mode_align_char = ':'



" ======================================== vim-markdown ===========================================


" ======================================== Key mapping for vCoolor plugin ===========================================
let g:vcoolor_map = '<leader>o'


" ======================================== Configure for vim-css-color ===========================================
let g:cssColorVimDoNotMessMyUpdatetime = 1


augroup javascript
  au BufReadPre * setlocal foldmethod=indent
" au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" ======================================== Configure for Explore ===========================================
let g:netrw_browse_split = 2


" ======================================== tagbar ===========================================
" nmap <F9> :TagbarToggle<CR>
" let g:tagbar_left = 1
" ======================================== NERDCommenter ===========================================
let g:NERDSpaceDelims = 1

" ======================================== syntastic ===========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_tex_checkers = [] 
let g:syntastic_python_checkers = [] 

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -lc++abi'


" ======================================== authorinfo ===========================================
let g:vimrc_author='YanlongLi'
let g:vimrc_email='lansunlong@gmail.com'
let g:vimrc_homepage='' 
nmap <F4> :AuthorInfoDetect<cr> 

" ======================================== ultisnips ===========================================

" make YCM compatible with UltiSnips (using supertab)

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:UltiSnipsExpandTrigger="<ENTER>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical""

" ======================================== js beautify ===========================================
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" ======================================== calendar===========================================
let g:calendar_frame = 'default'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ======================================== vimwiki===========================================
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/mywiki/', 
			\ 'path_html': '/var/www/html/wiki',
			\ 'css_name': 'style.css',
      \ 'nested_syntaxes': {'python': 'python', 'c++': 'cpp', "javascript": "js"},
			\ 'auto_export': 0},{
			\ 'path': '/srv/vimwiki/wikimd/',
			\ 'path_html': '/srv/vimwiki/wikimd_html/',
			\ 'ext': '.md',
			\ 'custom_wiki2html': 'vimwiki_markdown',
			\ 'syntax': 'markdown',
			\ 'template_path': '/srv/vimwiki/wikimd/templates/',
      \ 'template_default': 'default',
      \ 'template_ext': '.tpl'
			\ }]

map <leader>tl <Plug>VimwikiToggleListItem
let g:vimwiki_use_calendar = 1
let g:vimwiki_global_ext = 0

" ======================================== closetag ===========================================
let g:closetag_filenames = "*.html"

" ======================================== YouCompleteMe===========================================

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" ======================================== neocomplete ===========================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
""""" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


