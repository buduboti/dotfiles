
function! functions#lightlineFilename()
	let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
	if filename =~ 'NERD_tree'
		return ''
	endif
	let modified = &modified ? ' +' : ''
	return fnamemodify(filename, ":~:.") . modified
endfunction

function! functions#lightlineFileType()
	return ""
	" return WebDevIconsGetFileTypeSymbol()
endfunction

function! functions#modifyTab()
	if &expandtab == 1
		:set expandtab!
	else
		:set expandtab
	endif
endfunction

function! functions#modifyWhiteSpacesAndNumbers()
	if &list == 1
		:set list!
		:set number!
		:set relativenumber!
	else
		:set list
		:set number
		:set relativenumber
	endif
endfunction

function! functions#WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! functions#MainTitleMD()
    normal! mmyypVr=`m
endfunction

function! functions#SecondTitleMD()
    normal! mmyypVr-`m
endfunction

function! functions#ThirdTitleMD()
    normal! mmI### 
endfunction
