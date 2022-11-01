set number  
set autoindent 
set smartindent 
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a 
set background=light
set nocompatible 
syntax on

call plug#begin()

	" {{ Status bar }}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" {{ NERDTree help to view files on the left side }}
	Plug 'preservim/nerdtree'							" file browser
	Plug 'Xuyuanp/nerdtree-git-plugin'						" git status
	Plug 'ryanoasis/vim-devicons'							" icon
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

		" {{ syntax plugin for 100 languages }}
	Plug 'sheerun/vim-polyglot'

	" {{ command line fuzzy finder - help to search file }}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	" {{ tagbar }}
	Plug 'https://github.com/preservim/tagbar'                                
	" install dependency of tarbar on Ubuntu: sudo apt-get install exuberant-ctags 
	" install dependency of tarbar on Fedora: sudo yum install ctags-etags

	" {{ autocomplete code }}
	Plug 'jiangmiao/auto-pairs'							" Parenthesis auto
	
	" {{ terraform }}
	Plug 'hashivim/vim-terraform'

	" {{ others }}
	Plug 'https://github.com/ap/vim-css-color'					" CSS Color Preview
	Plug 'https://github.com/tpope/vim-commentary'					" For Commenting gcc & gc
	Plug 'tpope/vim-fugitive'							" Git
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }		" mardown preview

call plug#end()

" {{ change status bar }}
let g:airline#extensions#tabline#enabled = 1 				" Enable Tab bar
let g:airline#extensions#tabline#left_sep = ' ' 			" Enable Tab seperator 
let g:airline#extensions#tabline#left_alt_sep = '|' 			" Enable Tab seperator
let g:airline_theme='angr'

" {{ config nerdtree }}
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Change arrow to expand/collapse tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" {{ config icon }}
set encoding=UTF-8

" Git status icon
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Hightlight current file
let g:nerdtree_sync_cursorline = 1

" {{ config fuzzy finder }}
map <C-P> :Files<CR> 

" {{ config tagbar }}
nmap <F8> :TagbarToggle<CR>
