set number							" setup number on the left side 
set autoindent					" setup indentation
set smartindent 
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a							" setup using mouse on Vim
set nocompatible				" setup syntax highlight
syntax on
set background=light
" set ignorecase " Ignore sensitive case

" {{ install plugin }}
call plug#begin()

	" {{ Status bar }}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" {{ NERDTree help to view files on the left side }}
	Plug 'preservim/nerdtree'																												" file browser
	Plug 'Xuyuanp/nerdtree-git-plugin'																							" git status
	" Plug 'ryanoasis/vim-devicons'																									" icon
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	
	" {{ syntax plugin for 100 languages }}
	Plug 'sheerun/vim-polyglot'

	" {{ command line fuzzy finder - help to search file }}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim' 

	Plug 'https://github.com/ap/vim-css-color'																				" CSS Color Preview
	Plug 'https://github.com/tpope/vim-commentary'																		" For Commenting gcc & gc
	Plug 'tpope/vim-fugitive'																													" Git
	" Plug 'https://github.com/rafi/awesome-vim-colorschemes'													" Retro Scheme
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }						" mardown preview

	" {{ autocomplete code }}
	Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 

call plug#end()

" colorscheme github

" {{ change status bar }}
let g:airline#extensions#tabline#enabled = 1						" Enable Tab bar
let g:airline#extensions#tabline#left_sep = ' '					" Enable Tab seperator 
let g:airline#extensions#tabline#left_alt_sep = '|' 		" Enable Tab seperator

let g:airline_theme='angr'

" {{ config nerdtree }}
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

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
" map <C-H> :History<CR>
" map <C-U> :Buffers<CR>
