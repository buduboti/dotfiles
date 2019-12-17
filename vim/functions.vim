
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
