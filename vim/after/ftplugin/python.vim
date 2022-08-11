
setlocal expandtab

function! Run()
	:w 
	let path = expand('%:p')
	if system(printf('head -c2 %s', path)) == '#!' 
		:vnew | read ! #:p
	else 
		:vnew | read ! python3 #
	endif
endfunction

