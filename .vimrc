let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'digitaltoad/vim-jade'
Plug 'Shutnik/jshint2.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/csapprox'
Plug 'vim-scripts/Colour-Sampler-Pack'
Plug 'vim-scripts/ScrollColors'
Plug 'mhinz/vim-startify'
Plug 'sjl/gundo.vim'
Plug 'itchyny/screensaver.vim'
Plug 'octref/RootIgnore'
Plug 'simeji/winresizer'
"Plugin 'L9'
"Plugin 'corntrace/bufexplorer'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'FuzzyFinder'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'tpope/vim-endwise'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-repeat'
"Plugin 'emnh/taglist.vim'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'mattn/webapi-vim'
"Plugin 'mattn/gist-vim'
"Plugin 'mileszs/ack.vim'
"Plugin 'jamessan/vim-gnupg'
"Plugin 'heartsentwined/vim-emblem'
"Plugin 'tmhedberg/matchit'
"Plugin 'christoomey/vim-run-interactive'
call plug#end()

filetype plugin indent on
syntax on

" define mapleader
let mapleader = ","
let maplocalleader = "\\"

" disable viminfo (vim action log file wtf)
set viminfo=

" fix for zshenv not working for :!
set shell=zsh\ -i

" Colorscheme
colorscheme wombat256mod

" Syntax Hilighting
syntax on

" Dont synhilight to infinity
set synmaxcol=250

" Indentation Settings
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" copy and paste
set clipboard=unnamed
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

" Ctrl-T to toggle NerdTree
noremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> <Esc>:NERDTreeToggle<CR>

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
