" Vim syntax file
" Language: LBNF
" Add this to your vimrc "au bufreadpre,bufnewfile *.cf set ft=lbnf" 
" and put this file in ~/.vim/syntax/
" Author: Jim Persson <di2peji [AT] student [DOT] chalmers [dot] se>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match lbnfStatement /^entrypoints/
syn match lbnfStatement /^comment/
syn match lbnfComment   /^--.*$/
syn match lbnfLabel     /^\w*\./ nextgroup=lbnfClass
syn match lbnfClass     /.*/ contained contains=lbnfEquals,lbnfString,lbnfList,lbnfIdent
syn match lbnfEquals    /::=/ contained
syn match lbnfIdent     / [a-zA-Z0-9]*/ contained

syn region lbnfString start=+"+ end=+"+
syn region lbnfList   start=+\[+ end=+\]+

hi link lbnfStatement	Include
hi link lbnfString		String
hi link lbnfList		Special
hi link lbnfComment		Comment
hi link lbnfLabel		Statement
hi link lbnfClass		SpecialComment
hi link lbnfEquals		Define
hi link lbnfIdent		NONE
