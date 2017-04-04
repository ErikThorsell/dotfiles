" $HOME/.config/nvim/config/line.vimrc
"
" all status line configuration goes here
set cmdheight=1
set display+=lastline

" general config
set laststatus=2        " always show status line
set showtabline=2       " always show tabline
set noshowmode          " hide default mode text (e.g. INSERT) as airline already displays it

" airline config
let g:airline_powerline_fonts = 1                   " use powerline fonts
let g:airline#extensions#tabline#enabled = 1        " buffers at the top as tabs
let g:airline#extensions#tabline#show_tabs = 0      " puts ``tab m/n'' instead of name of tab in right corner
let g:airline#extensions#tabline#show_tab_type = 0  " disallows ``buffers'' to appear in top right corner

" symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''

