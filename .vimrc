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
"set statusline+=\ %{CocState()}
"	function! CocState() abort
"	if coc#status() != ""
"		return " [" . coc#status() . get(b:,'coc_current_function','') . "]"
"	else 
"		return ""
"endfunction
set statusline+=\ %{ALEState()}
function! ALEState() abort
	if g:ale_enabled
		let l:counts = ale#statusline#Count(bufnr(''))

		let l:all_errors = l:counts.error + l:counts.style_error
		let l:all_non_errors = l:counts.total - l:all_errors

		return l:counts.total == 0 ? '[ALE]' : printf(
					\ '[%dW %dE]',
					\ all_non_errors,
					\ all_errors
					\)
	else 
		return ""
	endif
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
"nnoremap <silent> <leader>cf :call CocActionAsync('format')<cr>

" IDE tools

" Old Coc Config
"inoremap <silent><expr> <Tab>
"			\ coc#pum#visible() ? coc#pum#next(1) :
"			\ CheckBackspace() ? "\<Tab>" :
"			\ coc#refresh()
"inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
"function! CheckBackspace() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1] =~# '\s'
"endfunction
"
"nnoremap <leader>at :call CocAction('diagnosticToggle')<CR>
"function! CocToggle() 
"	if g:coc_enabled
"		:CocDisable
"	else
"		:CocEnable
"	endif
"endfunction	
"nnoremap <C-n> <Plug>(coc-diagnostic-next)
"nnoremap <C-p> <Plug>(coc-diagnostic-prev)
"nnoremap <leader>aa <Plug>(coc-codeaction-cursor)
"nnoremap <leader>af <Plug>(coc-fix-current)
"nnoremap <leader>ad <Plug>(coc-definition)
"nnoremap <leader>au <Plug>(coc-references)
"nnoremap <leader>ar <Plug>(coc-rename)
"nnoremap <leader>ah <Plug>(coc-hover)
"nnoremap <leader>ai :call ShowDocumentation()<CR>
"function! ShowDocumentation()
"	if CocAction('hasProvider', 'hover')
"		call CocActionAsync('doHover')
"	else
"		call feedKeys('K', 'in')
"	endif
"endfunction

" Ale config
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

"ia pf pub fn
"ia ps pub struct

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
"	Plug 'prabirshrestha/vim-lsp'
	Plug 'Exafunction/codeium.vim'
"	Plug 'neoclide/coc.nvim', {'branch': 'release'}
"	Plug 'hsanson/vim-android'
"	Plug 'https://github.com/pimalaya/himalaya-vim'
"	Plug 'sainnhe/everforest'
call plug#end()

" plugins setup

"let b:coc_suggest_disable = 1
"let g:coc_auto_correct = 0
"let g:coc_disable_startup_warning = 1
"let g:coc_enable_hightlight = 0
"let g:coc_snippet_next = ''
"let g:coc_rust_analyzer_check_on_save = 0
"let g:coc_rust_analyzer_cargo_watch_enable = 0

set omnifunc=ale#completion#OmniFunc
let g:ale_enable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 0
"let g:ale_history_log_output = 1
"let g:ale_debug = 1
"let g:ale_completion_enabled = 1
"let g:ale_hover_to_floating_preview = 1

"let g:ale_java_eclipselsp_path = '$HOME/jdt-language-server'
"let g:ale_java_eclipselsp_executable = '/usr/libexec/java'
let g:ale_completion_autoimport = 1
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

" LSP {{{

"if executable('rust-analyzer')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'rust',
"        \ 'cmd': {server_info->['rust-analyzer']},
"        \ 'allowlist': ['rust'],
"        \ })
"endif
"
"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    nmap <buffer> gd <plug>(lsp-definition)
"    nmap <buffer> gs <plug>(lsp-document-symbol-search)
"    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"    nmap <buffer> gr <plug>(lsp-references)
"    nmap <buffer> gi <plug>(lsp-implementation)
"    nmap <buffer> gt <plug>(lsp-type-definition)
"    nmap <buffer> <leader>rn <plug>(lsp-rename)
"    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"    nmap <buffer> K <plug>(lsp-hover)
"    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
"
"    let g:lsp_format_sync_timeout = 1000
"    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"    
"    " refer to doc to add more commands
"endfunction
"
"augroup lsp_install
"    au!
"    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END

" }}}
