" =============================================================================
"      FileName: vimwiki.vim
"          Desc: 
"      HomePage: 
" =============================================================================
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
let g:vimwiki_dir_link = 'index'

