" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" Install vim-plug if not installed {{{

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" }}}

" plugins list {{{

call plug#begin()

" general functionality{{{

" coc: Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fuzzy finder
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'liuchengxu/vim-clap'
Plug 'vn-ki/coc-clap'

" global extensions
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-pairs',
            \'coc-lists',
            \'coc-json',
            \'coc-python',
            \'coc-markdownlint',
            \'coc-highlight',
            \'coc-explorer',
            \'coc-floaterm',
            \'coc-fzf-preview',
            \'coc-git',
            \]

" coc-highlight
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-doHover)

" navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" coc-lists
nmap <leader><leader> [clap]
xmap <leader><leader> [clap]
" nnoremap <leader><leader>f :<c-u>CocList files<cr>
" nnoremap <leader><leader>b :<c-u>CocList buffers<cr>
" nnoremap <leader><leader>c :<c-u>CocList vimcommands<cr>
" nnoremap <leader><leader>l :<c-u>CocList lines<cr>
" nnoremap <leader><leader>w :<c-u>CocList words<cr>
" nnoremap <leader><leader>m :<c-u>CocList maps<cr>
" nnoremap <leader><leader>d :<c-u>CocList diagnostics<cr>
" nnoremap <leader><leader>t :<c-u>CocList floaterm<cr>

nnoremap <silent> [clap]f :<c-u>Clap files<cr>
nnoremap <silent> [clap]b :<c-u>Clap buffers<cr>
nnoremap <silent> [clap]c :<c-u>Clap command<cr>
nnoremap <silent> [clap]l :<c-u>Clap blines<cr>
nnoremap <silent> [clap]m :<c-u>Clap maps<cr>
nnoremap <silent> [clap]o :<c-u>Clap tags<cr>
nnoremap <silent> [clap]d :<c-u>Clap coc_diagnostics<cr>
nnoremap <silent> [clap]t :<c-u>Clap floaterm<cr>

" rename
nmap <leader>rn <Plug>(coc-rename)

" multi cursor
nmap <leader>m <Plug>(coc-cursors-word)

" format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" tab completion
" inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
 
" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"            \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" jk to select completion entry and <cr> to trigger the completion
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
inoremap <expr> <c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

" coc-explorer
nnoremap <c-e> :<c-u>CocCommand explorer --quit-on-open<cr>

" }}}

" floaterm: 🌟 Use nvim/vim's builtin terminal in the floating/popup window {{{

Plug 'voldikss/vim-floaterm'

" autoclose floaterm when job exits normally
let g:floaterm_autoclose = 1
" open command for opening a file from floaterm 
let g:floaterm_open_command = 'vsplit'

" command to open lazygit
command! Lazygit FloatermNew lazygit
" command to open python shell, :FloatermSend to send selected lines to interactive shell
command! Pyshell FloatermNew python

" open new floaterm
nnoremap <silent> <leader>nt :<c-u>FloatermNew<cr>
nnoremap <silent> <leader>t :<c-u>FloatermToggle<cr>

" }}}

" vista: 🌵 Viewer & Finder for LSP symbols and tags {{{

Plug 'liuchengxu/vista.vim'

let g:vista_default_executive = 'coc'

" autoclose when vista left alone
autocmd bufenter * if (winnr("$") == 1 && &filetype =~# 'vista') | q | endif

" ,o to toggle display outline
nnoremap <silent> <leader>o :<c-u>Vista!!<cr>

" }}}

" vim-easy-replace: Vim plugin for quick and easy replacement {{{

Plug 'kqito/vim-easy-replace'
" <leader>ra to replace
" <leader>rc to replace the words under the cursor

" }}}

" caw: vim comment plugin {{{

Plug 'tyru/caw.vim'

" toggle comment current line or selected line
nmap <leader>/ <Plug>(caw:hatpos:toggle)
vmap <leader>/ <Plug>(caw:hatpos:toggle)

" }}}

" easymotion: Vim motions on speed! {{{

Plug 'easymotion/vim-easymotion'

" disable easymotion default keymap
let g:EasyMotion_do_mapping = 0
" turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" jump to anywhere with 2 char
nmap s <Plug>(easymotion-overwin-f2)
" search motion, n/N to next/prev match
nmap / <Plug>(easymotion-sn)
" line motion
nmap <leader>L <Plug>(easymotion-overwin-line)
" keep cursor column when JK motion
let g:EasyMotion_startofline = 0

" }}}

" }}}

" Colorscheme/Appearance {{{

" colorscheme {{{
Plug 'srcery-colors/srcery-vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gkapfham/vim-vitamin-onec'
" }}}

" lightline: A light and configurable statusline/tabline plugin for Vim {{{
Plug 'itchyny/lightline.vim'

let g:lightline = {
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
            \ [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
        \ 'cocstatus': 'coc#status'
    \ }
\ }

" short mode name
let g:lightline.mode_map = {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
\ }
let g:lightline.subseparator = { 'left': '', 'right': '' }
" }}}

" startify:🔗 The fancy start screen for Vim. {{{
Plug 'mhinz/vim-startify'

let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_use_env = 1
let g:startify_custom_header =
           \'startify#center([
           \" ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
           \" ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
           \"▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
           \"▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
           \"▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
           \"░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
           \"░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
           \"   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
           \"         ░    ░  ░    ░ ░        ░   ░         ░   ",
           \"                                ░                  ",
           \])'



" commands
let g:startify_commands = [
           \{ 'pu': [ 'Update Plugins', ':PlugUpdate | PlugUpgrade' ] },
           \{ 'pc': [ 'Clean Plugins', ':PlugClean' ] },
           \{ 'cu': [ 'Update CoC Plugins', ':CocUpdate' ] },
           \]

" bookmarks
let g:startify_bookmarks = [
           \{ 'c': '~/dotfiles/nvim/init.vim' },
           \{ 'p': '~/dotfiles/nvim/plugins.vim' },
           \{ 'g': '~/.gitconfig' },
           \{ 'f': '~/dotfiles/fish/config.fish' }
           \]
" }}}

" }}}

" Language specific {{{

" semshi: 🌈 Semantic Highlighting for Python in Neovim {{{
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" }}}

" simpylFold: No-BS Python code folding for Vim {{{
Plug 'tmhedberg/SimpylFold'
" }}}

" Markdown preview{{{
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" }}}

" Vim org-mode {{{
Plug 'jceb/vim-orgmode'

let g:org_export_emacs="/usr/local/bin/emacs"
" }}}

" Rubocop {{{
Plug 'ngmy/vim-rubocop'

augroup rubocop_fix
    autocmd!
    autocmd BufWritePost *.rb :RuboCop -A
augroup END
" }}}
" }}}

call plug#end()
" }}}

" colorscheme settings after loading plugins {{{
if (has("termguicolors"))
    set termguicolors
endif
syntax enable

" colorscheme specific config
" let g:miramare_enable_italic = 1

colorscheme srcery
let g:lightline.colorscheme = 'srcery'
" }}}
