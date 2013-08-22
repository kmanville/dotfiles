function! GenerateTabLine()
	let s = ''
	let t = tabpagenr()
	let i = 1
	while i <= tabpagenr('$')
		let index = tabpagebuflist(i)[tabpagewinnr(i)-1]

		"set color for the current tab
		let s .= (i== t ? '%#String#' : '%#Keyword#')
		"add tab number, with a '*' if buffer is modified
		let s .= ' [' . i
		let s .= (getbufvar(index, '&mod')) ? '*]' : ']'
		"add the buffer name
		"let fname = bufname(index)
		"if fname == ''
			"let fname = '---'
		"else
			"let fname = fnamemodify(fname, ":p:t")
		"endif
		"let s .= fname
		let s .= (bufname(index) == '') ? '---' : fnamemodify(bufname(index), ":p:t")

		let i = i + 1
	endwhile
	let s .= '%T%#NonText#%='
	return s
endfunction
