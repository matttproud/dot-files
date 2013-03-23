command! -nargs=* -complete=file PEdit :!g4 edit %
command! -nargs=* -complete=file PRevert :!g4 revert %
command! -nargs=* -complete=file PDiff :!g4 diff %

function! s:CheckOutFile()
	if filereadable(expand("%")) && ! filewritable(expand("%"))
		let option = confirm("Readonly file: Do you want to check it out from p4?", "&Yes\n&No", 1, "Question")
		if option == 1
			PEdit
		endif
		edit!
	endif
endfunction
au FileChangedRO * nested :call <SID>CheckoutFile()


execute pathogen#infect()

syntax enable
set background=light
colorscheme solarized
