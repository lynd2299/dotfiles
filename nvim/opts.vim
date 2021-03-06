" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" Options {{{
set autoread  " detect file is changed
set clipboard+=unnamedplus  " use system clipboard
set mouse=a  " enable mouse
set splitbelow splitright  " split window below/right
set nobackup  " do not make backup file
set nowritebackup
set noswapfile  " do not make swapfile
set noshowcmd  " do not show last command
set confirm  " confirm before close unsaved file
set updatetime=300  " default is 4000ms, too slow
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c  " do not pass messages to |ins-completion-menu|
set lazyredraw  " improve draw performance when navigating through large result

" searching
set ignorecase  " case insensitive search
set smartcase  " case sensitive if there is capital letter

filetype plugin indent on

set number  " show line num
set cursorline  " highlight current line
set showmatch  " highlight )
set cmdheight=1  " command bar height
set signcolumn=yes  " always show signcolumn
set noshowmode  " do not show mode
set showbreak=>\   " show '> ' before break line
set scrolloff=7  " always 7 lines under cursor
set wildmenu  " enhanced command line completion
set hidden  " current buffer go to background instead of close

" set concealcursor=nc
" let g:tex_conceal=''

" tab settings
set tabstop=4  " a tab is 4 spaces
set softtabstop=4  " <tab> inserts 4 spaces
set shiftwidth=4  " indent is 4 spaces
set expandtab  " use only space, not tab
set smarttab  " tab respects 'tabstop', 'softtabstop' and 'shiftwidth'
set autoindent
set smartindent

" invisible character
set list  " show invisible chaeacter
set listchars=tab:>-,trail:⋅,extends:>,precedes:<
" }}}
