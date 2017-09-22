execute pathogen#infect()

filetype on
syntax on
colorscheme Tomorrow-Night

set lines=35 columns=150
set colorcolumn=100
set number
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set showmatch

autocmd BufWritePre * :%s/\s\+$//e

set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>

set wildignore+=*.log,*.sql,*.cache
noremap <Leader>r :CommandTFlush<CR>

let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

let g:gitgutter_sign_column_always=1
