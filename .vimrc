" setup {{{
set nocompatible

set number
set relativenumber

set tabstop=2
set shiftwidth=2
set softtabstop=2

set ignorecase
set hlsearch incsearch

set cursorline

set splitbelow splitright

colorscheme just

set foldmethod=marker
set foldlevelstart=0

set backspace=indent,eol,start

nn <space> <nop>
let mapleader=" "
" }}}

" statusbar {{{
set laststatus=2
set statusline=\File:\%f\ Buffer:\%n
set statusline+=%=
set statusline+=\Line:\%l/%L\ Progress:\%p\%%
" }}}

" ru keys {{{
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
" }}}

" mappings {{{
nnoremap <silent> <esc><esc> :noh<cr>

no <leader>s :w<cr>
nn <leader>ve :vsplit $MYVIMRC<cr>
nn <leader>vs :source $MYVIMRC<cr>

nn <leader>/ I//<esc>

" quickfix
" nnoremap <leader>ff :execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr> 
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fw :Ngr 
nnoremap <leader>fb :Buff<cr>
nnoremap <leader>fo :copen<cr>
nnoremap <silent> <leader>fc :cclose<cr>
nnoremap <silent> <leader>fn :cnext<cr>
nnoremap <silent> <leader>fp :cprevious<cr>

" buffer
noremap <leader>bf <esc><c-w>\| <c-w>_
noremap <leader>br <esc><c-w>=
noremap <c-n> :Rex<cr>

noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

nnoremap <leader>tl :vsplit<cr>

" build
" nnoremap <leader>cc :!!RUSTFLAGS=-Awarnings cargo check<cr>
nnoremap <leader>cc :!RUSTFLAGS=-Awarnings cargo check<cr>
nnoremap <leader>cb :!RUSTFLAGS=-Awarnings cargo build<cr>
nnoremap <leader>cr :!RUSTFLAGS=-Awarnings cargo run<cr>
nnoremap <leader>ct :!RUSTFLAGS=-Awarnings cargo test 
nnoremap <silent> <leader>cf :w<cr>:!cargo fmt<cr>:e<cr>

" }}}

" abbreviatons {{{
ia pf pub fn
ia ps pub struct
" }}}

" plugins {{{
set nocp
call pathogen#infect()
syntax on
filetype plugin indent on
call pathogen#infect()

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" plugins setup

" }}}

" search {{{
set path+=**

set wildignore=**/.git/**,**/.cargo/**,**/.gradle/**,**/.xwin-cache/**
set wildignore+=**/assets/**,**/target/**,**/output/**

set wildmenu
set wildmode=full:lastused
" set wildoptions=pum
set wildoptions=fuzzy

command! -nargs=+ Ngr silent execute 'grep! -R --exclude-dir=".*" --exclude-dir={assets,target,output} --exclude="**\*.swp" <args> $PWD' | copen | redraw!
" }}}
