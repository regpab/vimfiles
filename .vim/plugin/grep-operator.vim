nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[y`]
	else
		return
	endif

	silent execute "grep! -R --exclude-dir='.*'	--exclude-dir={assets,target,output} " . shellescape(@@) . " $PWD"
	copen
	redraw!

	let @@ = saved_unnamed_register
endfunction
