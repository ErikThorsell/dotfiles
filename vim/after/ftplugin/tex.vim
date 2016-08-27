""""" LaTeX
set wrap
noremap <C-w><C-w> :w \| ! ./compile<Enter><Enter>

" res
nnoremap new <Esc>ggdG:.-1read ~/.res/latex/default.tex<Enter>
nnoremap item <esc>:.-1read ~/.res/latex/itemize.tex<enter>j$a
nnoremap enum <esc>:.-1read ~/.res/latex/enumerate.tex<enter>j$a
nnoremap fig <esc>:.-1read ~/.res/latex/figure.tex<enter>jj$i
nnoremap tab <esc>:.-1read ~/.res/latex/table.tex<enter>jj$i
nnoremap mini <esc>:.-1read ~/.res/latex/minipage.tex<enter>jj$i

" one liners
