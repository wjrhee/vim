call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do':'./install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
call plug#end()

set colorcolumn=100
set number

set hidden
set history=1000

syntax enable

filetype indent on
set term=builtin_ansi
set nocompatible
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set cursorline
set backspace=indent,eol,start  "Allow backspace in insert mode

set foldenable
set foldlevelstart=10
set foldnestmax=10

set showmode
set showcmd

set wildmenu

set incsearch
set hlsearch


set showmatch

autocmd BufWritePre * :%s/\s\+$//e

let mapleader="\<Space>"

map <leader>s :source ~/.vimrc<CR>

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"""" visual pane
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" ================ NERDTree ========================
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" ================ Git Gutter ======================
let g:gitgutter_sign_column_always=1

" ================= Seoul Color ======================
let g:seoul256_background = 236
colo seoul256

" ================= FZF with RipGrep :F ======================
" option 1
" let g:rg_command = '
"  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
"  \ -g "!{.git,node_modules,vendor}/*" '
"command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <leader>f :Rg<Cr>

nnoremap <C-p> :FZF<cr>

let g:indentLine_setConceal = 0
