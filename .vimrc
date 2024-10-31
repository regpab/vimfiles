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

" status bar {{{
set laststatus=2
set statusline=\File:\%f\ Buffer:\%n
set statusline+=%=
set statusline+=\Line:\%l/%L\ Progress:\%p\%%
" }}}

" ru keys {{{
set keymap=russian-jcukenwin
" set spell spelllang=ru_yo,en_us
set iminsert=0
set imsearch=0
" }}}

" mappings {{{
nnoremap <silent> <esc><esc> :noh<cr>

no <leader>s :w<cr>
nn <leader>ve :vsplit $MYVIMRC<cr>
nn <leader>vs :source $MYVIMRC<cr>

nn <leader>/ I//<esc>

" search
nnoremap <leader>ff :find 
nnoremap <leader>fw :Rg 
nnoremap <leader>fb :Buff<cr>
nnoremap <leader>fo :copen<cr>
nnoremap <silent> <leader>fc :cclose<cr>
nnoremap <silent> <leader>fn :cnext<cr>
nnoremap <silent> <leader>fp :cprevious<cr>
nnoremap <silent> <c-[> :MakeTags<cr>

" buffer
noremap <leader>bf <esc><c-w>\| <c-w>_
noremap <leader>br <esc><c-w>=
noremap <c-n> :Rex<cr>

noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

" build
nnoremap <leader>cc :Ccheck<cr>
nnoremap <leader>cb :Cbuild<cr>
nnoremap <leader>cr :Crun<cr>
nnoremap <leader>ct :Ctest
nnoremap <silent> <leader>cf :RustFmt<cr>
" }}}

" abbreviations {{{
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

call plug#end()

" plugins setup

" }}}

" search {{{
set path+=**

set wildignore=**/.git/**,**/.cargo/**,**/.gradle/**,**/.xwin-cache/**
set wildignore+=**/assets/**,**/target/**,**/output/**
set wildignore+=tags

set wildmenu
set wildmode=full:lastused
" set wildoptions=pum
set wildoptions=fuzzy

command! -nargs=+ Ngr silent execute 'grep! -R --exclude-dir=".*" --exclude-dir={assets,target,output} --exclude="**\*.swp" --exclude=tags <args> $PWD' | copen | redraw!

command! MakeTags silent execute '!ctags -R --exclude=assets --exclude=target --exclude=output .' | redraw!
" }}}
