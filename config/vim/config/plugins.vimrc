" $HOME/.config/nvim/config/plugins.vimrc
"
" File recognition
filetype plugin indent on
let g:tex_flavor = "latex"

" Add syntastic default settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Flake8 specific changes can be found in ~/.config/flake8

" Colorscheme
let g:gruvbox_italic=1              " enable italics
let g:gruvbox_color_column='bg0'     " change color of color column
set background=dark

colorscheme gruvbox                 " enable scheme

