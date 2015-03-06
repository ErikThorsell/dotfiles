""""" LaTeX
set wrap
noremap <C-s><C-s> :! pdflatex %<enter>

" res
nnoremap new <Esc>ggdG:.-1read ~/res/latex/default.tex<Enter>
nnoremap it <esc>:.-1read ~/res/latex/itemize.tex<enter>j$a
nnoremap en <esc>:.-1read ~/res/latex/enumerate.tex<enter>j$a
nnoremap fig <esc>:.-1read ~/res/latex/figure.tex<enter>jj$i

" one liners
nnoremap ip i\input{}<esc>i


