set number " setup number on the left side
set autoindent " setup indentation
set smartindent 
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a " setup using mouse on Vim
set ignorecase " Ignore sensitive case
syntax on
colorscheme sublimemonokai " Setup theme

" {{ install plugin }}
call plug#begin()

	" {{ Status bar }}
	Plug 'https://github.com/vim-airline/vim-airline' 

	" {{ NERDTree help to view files on the left side }}
	Plug 'preservim/nerdtree' " file browser
	Plug 'Xuyuanp/nerdtree-git-plugin' " git status
	Plug 'ryanoasis/vim-devicons' " icon
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" {{ config nerdtree }}
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" {{ config icon }}
set encoding=UTF-8

" {{ config git plugin }}
"
" Change arrow to expand/collapse tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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
