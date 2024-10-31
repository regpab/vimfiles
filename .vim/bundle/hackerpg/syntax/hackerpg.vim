if exists("b:current_syntax")
	finish
endif

syntax keyword hackerpgKeyword function move
highlight link hackerpgKeyword Keyword

syntax match hackerpgComment "\v//.*$"
highlight link hackerpgComment Comment

let b:current_syntax = "hackerpg"
