" Vim syntax file
" Language:     gm
" Maintainer:   Giacomo
" Last Change:  2018 Dec 31

" quit when a syntax file was already loaded.
if exists("b:current_syntax")
	finish
endif

" " the only item global
" syn region gmlang start="" end=""
" 	\ contains=comments,brackets,invalids,constants,variables
" 	\ transparent

" syn region brackets start="" end=""
" 	\ contains=roundBrackets,squareBrackets,curlyBrackets,lockSymbols,locator
" 	\ contained
" 	\ transparent
" " about brackets
" 	syn region roundBrackets	start="("	end=")"		contains=gmlang	contained	transparent	fold
" 	syn region squareBrackets	start="\["	end="\]"	contains=gmlang	contained	transparent	fold
" 	syn region curlyBrackets	start="{"	end="}"		contains=gmlang	contained	transparent	fold

" 	" syn region lockSymbols		start="&"	end="&"		contains=gmlang	contained	oneline
" 	" hi lockSymbols ctermfg=red
" 	" syn region locator	matchgroup=path	start="@\<[^\s,;:]\+\(\.[^\s,;:]\+\)*,"	end="■"	contains=gmlang	transparent	fold
" 	" " about path
" 	" 	syn match path 
" 	" " end
" " end

" syn region constants start=""	end=""
" 	\ contains=keywords,numeric,functions,strings
" 	\ contained
" 	\ transparent
" " about constants
" 	syn region keywords	start=""	end=""
" 		\ contains=delimiter,separator,controlFlow,controlDefine
" 		\ contained
" 		\ transparent
" 	" about keywords
" 		syn match delimiter		" \|^\t\+"			contained
" 		syn match separator		"," 				contained
" 		syn match controlFlow	"\(⇒\|⇔\|⇐\):\@!" contained
" 		syn match controlDefine	":"					contained
" 	" end
" 	syn match numeric "\<[0-9π]\>:\@!" contained
" 	" syn strings
" " end

" syn region invalids start=""	end=""
" 	\ contains=illegalDefine,illegalQuantifier,deprecatedTriple,deprecatedTab
" 	\ contained
" 	\ transparent
" " about invalids
" 	syn match illegalDefine		"\(^\|\s\|:\)\@<=:"	contained
" 	syn match illegalQuantifier	"\w\+[∀∃!]"			contained
" 	syn match deprecatedTriple	"```"				contained
" 	syn match deprecatedTab		"[^\t\n]\t\+"		contained
" " end

" syn region comments start="" end=""
" 	\ contains=blockComments,lineComments
" 	\ contained
" 	\ transparent
" " about comments
" 	syn region blockComments start="\(^\|[,({]\)\@<=\(\_s*\)\[" end="\]"
" 		\ contains=betterComments
" 		\ contained
" 		\ fold
" 	syn region lineComments start=";" end="\n"
" 		\ contains=betterComments
" 		\ contained

" 	syn region betterComments start="" end=""
" 		\ contains=commentsTodo,commentsNote,commentsWait,commentsWarn
" 		\ contained
" 	" about betterComments
" 		syn match commentsTodo "\c\(\(;\|^\)\(\s*\)\)\@<=\(+\|todo\).\{-}\($\|\s;\)\@=" 	contained	display
" 		syn match commentsNote "\c\(\(;\|^\)\(\s*\)\)\@<=\(\*\|note\).\{-}\($\|\s;\)\@=" 	contained	display
" 		syn match commentsWait "\c\(\(;\|^\)\(\s*\)\)\@<=\(?\|wait\).\{-}\($\|\s;\)\@=" 	contained	display
" 		syn match commentsWarn "\c\(\(;\|^\)\(\s*\)\)\@<=\(!\|warn\).\{-}\($\|\s;\)\@=" 	contained	display
" 	" end
" " end

" hi def link lineComments	Comment
" hi def link blockComments	Comment
" hi commentsTodo ctermfg=bg	guifg=bg	ctermbg=yellow	guibg=yellow	
" hi commentsNote ctermfg=bg	guifg=bg	ctermbg=green	guibg=green	
" hi commentsWait ctermfg=bg	guifg=bg	ctermbg=blue	guibg=blue	
" hi commentsWarn ctermfg=bg	guifg=bg	ctermbg=red		guibg=red		

" hi def link numeric			Number
" hi def link controlDefine	Conditional
" hi def link controlFlow		Conditional

" hi def link illegalDefine Error
" hi def link illegalQuantifier Error
" hi def link deprecatedTriple Error
" hi def link deprecatedTab Error


" let b:current_syntax = "gm"
