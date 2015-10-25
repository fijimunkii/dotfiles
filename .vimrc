" Load Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundles
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-markdown'
Plugin 'corntrace/bufexplorer'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'emnh/taglist.vim'
Plugin 'godlygeek/csapprox'
Plugin 'vim-scripts/Colour-Sampler-Pack'
Plugin 'vim-scripts/ScrollColors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mhinz/vim-startify'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'sjl/gundo.vim'
Plugin 'mileszs/ack.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'heartsentwined/vim-emblem'
Plugin 'Shutnik/jshint2.vim'
Plugin 'tmhedberg/matchit'
Plugin 'christoomey/vim-run-interactive'
Plugin 'itchyny/screensaver.vim'
Plugin 'digitaltoad/vim-jade'

" re-enable stuff after vundle
call vundle#end()
filetype plugin indent on

" define mapleader
let mapleader = ","
let maplocalleader = "\\"

" fix for zshenv not working for :!
set shell=zsh\ -i

" Colorscheme
colorscheme wombat256mod

" Syntax Hilighting
syntax on

" Dont synhilight to infinity
set synmaxcol=250

" Indentation Settings
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on

" copy and paste
set pastetoggle=<C-o>
vnoremap <C-c> "+yi
vnoremap <C-x> "+c
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa

" Allow saving of files as sudo
cmap w!! w !sudo tee > /dev/null %

" <leader> r to run a shell command
nnoremap <leader>r :RunInInteractiveShell<space>

" ctrl-f to recursively search files
nnoremap <C-f> :Ack

" Ultimate Undo aka GUNDO
nnoremap <C-z> :GundoToggle<CR>
let g:gundo_preview_height = 22

" semicolon / colon
noremap ,c :cd ~/code<cr>
noremap ; :
noremap : ;

" jj to escape
inoremap jj <Esc>

" kk to escape
inoremap kk <Esc>

" Super speed
" Simply hold shift in command mode
" And ctrl in insert mode
" noremap H 15h
" noremap J 15j
" noremap K 15k
" noremap L 15l
inoremap <C-h> <Esc>i
inoremap <C-j> <Esc>jli
inoremap <C-k> <Esc>kli
inoremap <C-l> <Esc>2li

" space goes to insert mode
nnoremap <Space> i

" CTRL - & CTRL _ move lines around
noremap <C--> ddp
noremap <C-_> ddkkp

" > and < indent and unindent
nnoremap > >>
nnoremap < <<

" <leader> ev to edit .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" <leader> sv to source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Search Hightlight Toggle
set nohlsearch
nnoremap <silent> <C-N> :se invhlsearch<CR>

" Search as you type
set incsearch

" Ctrl-\ to run JSHint
noremap <C-\> :JSHint<CR>
inoremap <C-\> <Esc>:JSHint<CR>

" Ctrl-T to toggle NerdTree
noremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> <Esc>:NERDTreeToggle<CR>

" Switch between windows, maximizing the current window
nnoremap <C-J> <C-W>j<C-W>_ 
nnoremap <C-K> <C-W>k<C-W>_

" Make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Allow windows to get fully squashed
set winminheight=0

" Line Numbers
set number

" Funny Business
set relativenumber

" Current marker postion
set ruler

" Ignore Files
set wildignore+=*.swp

" when used with vim -u, disable local .vimrc
set nocompatible

" ESCape key stuff
" disable 0[ recognition in insert mode
set noesckeys
" speed up normal escape key
let &t_ti.="\e[?7727h"
let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <C-c>

" Set Statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Show hidden files by default in nerdtree
let NERDTreeShowHidden=1

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
