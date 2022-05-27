set number " setup number on the left side 
set autoindent " setup indentation
set smartindent 
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a " setup using mouse on Vim
set nocompatible " setup syntax highlight
set background=dark
syntax on
" set ignorecase " Ignore sensitive case

" {{ install plugin }}
call plug#begin()

	" {{ Status bar }}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" {{ NERDTree help to view files on the left side }}
	Plug 'preservim/nerdtree' " file browser
	Plug 'Xuyuanp/nerdtree-git-plugin' " git status
	Plug 'ryanoasis/vim-devicons' " icon
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	
	" {{ syntax plugin for 100 languages }}
	Plug 'sheerun/vim-polyglot'
	Plug 'pangloss/vim-javascript'

	" {{ install ESlint }}
	Plug 'dense-analysis/ale'
	
	" {{ install Prettier }}
	Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

	" {{ command line fuzzy finder - help to search file }}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim' 

	Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
	Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
	Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
	Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
	Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

	" {{ autocomplete code }}
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jiangmiao/auto-pairs' 					" Parenthesis auto 
	Plug 'alvan/vim-closetag'
	Plug 'mattn/emmet-vim' 
	" Plug 'preservim/nerdcommenter' 					" Comment code 
	" Plug 'liuchengxu/vista.vim' 					" Function tag bar 
	Plug 'alvan/vim-closetag' 						" Auto close HTML/XML tag

	" Source code version control 
	Plug 'tpope/vim-fugitive' 						" Git

call plug#end()

" {{ change status bar }}
let g:airline#extensions#tabline#enabled = 1 				" Enable Tab bar
let g:airline#extensions#tabline#left_sep = ' ' 			" Enable Tab seperator 
let g:airline#extensions#tabline#left_alt_sep = '|' 		" Enable Tab seperator
"let g:airline_theme='angr'								    " Use theme for status bar

" {{ config nerdtree }}
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

" {{ config ESlint }}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" {{ config Prettier }}
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md,*.yaml,*.yml,*.html Prettier  " Auto format 

" {{ config icon }}
set encoding=UTF-8

" {{ config git plugin }}
"
" Change arrow to expand/collapse tree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'

"let NERDTreeMapOpenInTab='<ENTER>'

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
