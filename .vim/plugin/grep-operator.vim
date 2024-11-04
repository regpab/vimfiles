nnoremap <leader>gw :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>gw :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[y`]
	else
		return
	endif
	execute "Rg -i -g '!tags' " . shellescape(@@)
" silent execute "grep! -R --exclude-dir='.*'	--exclude-dir={assets,target,output} " . shellescape(@@) . " $PWD"
	copen
"	redraw!

	let @@ = saved_unnamed_register
endfunction

nnoremap <leader>gf :set operatorfunc=<SID>FindOperator<cr>g@
vnoremap <leader>gf :<c-u>call <SID>FindOperator(visualmode())<cr>

function! s:FindOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[y`]
	else
		return
	endif
	
	execute "find " . shellescape(@@)

	let @@ = saved_unnamed_register
endfunction
