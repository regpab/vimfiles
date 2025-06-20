" setup {{{
set nocompatible

set number
set relativenumber

set tabstop=4
set shiftwidth=4
set softtabstop=4

set ignorecase
set hlsearch incsearch

set cursorline

set lazyredraw

set splitbelow splitright

let g:netrw_banner=0
let g:netrw_liststyle=1

colorscheme justdark

set foldmethod=marker
set foldlevelstart=0

set backspace=indent,eol,start

nn <space> <nop>
let mapleader=" "

set signcolumn=number

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Fix backspace
set t_kb=
" }}}

" status bar {{{
set laststatus=2
set statusline=\File:\%f\ Buffer:\%n
set statusline+=%=
"set statusline+=\Line:\%l/%L\ Progress:\%p\%%
set statusline+=\Progress:\%p\%% 
"set statusline+=\ %{GradleState()}
let g:gradle_glyph_gradle='[GRADLE]'
let g:gradle_glyph_android='[ANDROID]'
function! GradleState() abort
	if gradle#running()
		return "[RUNNING]"
	else
		return lightline#gradle#project()
	endif
endfunction
set statusline+=\%{ALEState()}
function! ALEState() abort
	return g:ale_enabled ? " [ALE]" : ""
endfunction
set statusline+=\%{CodeiumState()}
function! CodeiumState() abort
	return g:codeium_enabled ? " [CODEIUM]" : ""
endfunction
" }}}

" ru keys {{{
set keymap=russian-jcukenwin
autocmd FileType text setlocal spell spelllang=ru_yo,en_us
set iminsert=0
set imsearch=0
" }}}

" mappings {{{
nn <esc><esc> :noh<cr>

no <leader>s :w<cr>
nn <leader>ve :vsplit $MYVIMRC<cr>
nn <leader>vs :source $MYVIMRC<cr>:colorscheme justdark<cr>
nn <leader>vc :vsplit ~/.vim/colors/justdark.vim<cr>

nn <leader>/ I//<esc>

nnoremap <leader>h :term<cr> 

" search
nnoremap <leader>ff :find 
nnoremap <leader>fw :Ngr 

nnoremap <leader>fo :copen<cr>
nnoremap <silent> <leader>fc :cclose<cr>
nnoremap <silent> <leader>fn :cnext<cr>
nnoremap <silent> <leader>fp :cprevious<cr>
nnoremap <silent> <leader>fm :MakeTags<cr>

" buffer
noremap <leader>bf <esc><c-w>\| <c-w>_
noremap <leader>br <esc><c-w>=
noremap <leader>n :Rex<cr>

noremap <c-l> <c-w>l
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

noremap <leader>cy "+y
noremap <leader>cp "+p

" build
autocmd FileType rust set makeprg=cargo\ check\ --message-format\ short
nnoremap <leader>cm :make<cr>
nnoremap <leader>cc :Ccheck<cr>
nnoremap <leader>cb :Cbuild<cr>
nnoremap <leader>cr :Crun<cr>
nnoremap <leader>ct :Ctest 
nnoremap <silent> <leader>cf :RustFmt<cr>

" IDE tools
inoremap <silent><expr> <Tab>
      \ getline('.') =~ '^\s*$' ? "\<Tab>" : pumvisible() ? "\<C-n>" : "\<C-x><C-o>"

inoremap <silent><expr> <S-Tab>
      \ getline('.') =~ '^\s*$' ? "\<S-Tab>" : pumvisible() ? "\<C-p>" : "\<C-x><C-o>"

nnoremap <C-n> :ALENext<cr>
nnoremap <C-p> :ALEPrevious<cr>
nnoremap <leader>at :ALEToggle<cr>
nnoremap <leader>aa :ALECodeAction<cr>
nnoremap <leader>al :ALELint<cr>
nnoremap <leader>ah :ALEHover<cr>
nnoremap <leader>ad :ALEGoToDefinition<cr>
nnoremap <leader>au :ALEFindReferences<cr>
nnoremap <leader>ar :ALERename<cr>
nnoremap <leader>as :ALESymbolSearch 
nnoremap <leader>ai :ALEInfo<cr> 
nnoremap <leader>aq :ALEPopulateQuickfix<cr>

" Codeium
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <script><silent><nowait><expr> <C-h> codeium#AcceptNextWord()
imap <script><silent><nowait><expr> <C-l> codeium#AcceptNextLine()
imap <C-j>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-k>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>
" }}}

" abbreviations {{{
ia pf pub fn
ia ps pub struct
cabbrev vsf vert sfind
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
"	Plug 'regpab/pathy.vim'
	Plug 'dense-analysis/ale'
	Plug 'Exafunction/codeium.vim'
	Plug 'hsanson/vim-android'
"	Plug 'sainnhe/everforest'
call plug#end()

" plugins setup
set omnifunc=ale#completion#OmniFunc
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 1

"let g:ale_java_eclipselsp_path = '$HOME/jdt-language-server'
"let g:ale_java_eclipselsp_executable = '/usr/libexec/java'
"let g:ale_completion_autoimport = 1
"let g:ale_completion_enabled = 1
"let g:ale_hover_to_floating_preview = 1
"let g:gradle_loclist_show = 0
"let g:gradle_show_signs = 0
"let g:ale_linters = {
"     \ 'xml': ['android'],
"     \ 'groovy': ['android'],
"     \ 'java': ['android', 'checkstyle', 'eclipselsp'],
"     \ 'kotlin': ['android', 'ktlint', 'kotlinc', 'kotlin-lanuage-server']
" \ }
"let g:ale_fixers = {
"\	'kotlin': ['ktlint']
"\}
"let g:ale_kotlin_kotlin_language_server_executable = 'kotlin-language-server'
"let g:ale_kotlin_kotlin_language_server_config = {
"\   'trace': 'verbose',  
"\   'kotlin': {
"\     'compiler': { 'jvm': { 'target': '17' } },  
"\   },
"\}

let g:codeium_disable_bindings = 1
let g:codeium_enabled = v:false

" To run everforest:
" if has('termguicolors')
"          set termguicolors
"        endif
"let g:everforest_background="hard"
"set background=dark
"colorscheme everforest

let g:android_sdk_path="$HOME/Library/Android/sdk"
" }}}

" search {{{
"set path+=g:pathy_path
"let g:pathy_exclude = []

set wildignore=*/.git/*,*/.cargo/*,*/.gradle/*,*/.xwin-cache/*
set wildignore+=*/assets/*,*/target/*,*/output/*
set wildignore+=tags
set wildignore+=*.dex,*.class*,*/build/*

set wildmenu
set wildmode=full:lastused
" set wildoptions=pum
set wildoptions=fuzzy

" command! -nargs=+ Ngr silent execute 'grep! -R --exclude-dir=".*" --exclude-dir={assets,target,output} --exclude="**\*.swp" --exclude=tags <args> $PWD' | copen | redraw!

command! -nargs=+ Ngr execute 'Rg -i -g "!tags" <args>'

command! MakeTags execute '!ctags -R --exclude=assets --exclude=target --exclude=output --exclude=build .' | redraw!
" }}}
