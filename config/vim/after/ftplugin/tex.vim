""""" LaTeX
set nowrap
noremap <C-w><C-w> :w \| call Compile()<CR>
noremap <C-s> :w \| call Compile()<CR>

" res
nnoremap item <esc>:.-1read ~/.res/latex/itemize.tex<enter>j$a
nnoremap enum <esc>:.-1read ~/.res/latex/enumerate.tex<enter>j$a
nnoremap fig <esc>:.-1read ~/.res/latex/figure.tex<enter>jj$i
nnoremap mini <esc>:.-1read ~/.res/latex/minipage.tex<enter>jj$i
nnoremap optprob <esc>:.-1read ~/.res/latex/optprob.tex<enter>jj$i
nnoremap lstset <esc>:.-1read ~/.res/latex/lstset.tex<enter>t$

" Functions
" Smart compile function that checks if comile script exsists:
function! Compile()
    if filereadable("compile.sh")
        echo "Using compile script"
        execute '!./compile.sh'
    else
        echo "Compiling with pdflatex"
        execute '!pdflatex -shell-escape %'
    endif
endfunction

