" $HOME/.config/nvim/config/plugins.vimrc
"
" File recognition
filetype plugin indent on
let g:tex_flavor = "latex"

"" Invoke deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#disable_auto_complete = 0 " set to 1 if you want to disable autocomplete
"
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
"" Disable deoplete for .tex
"autocmd FileType tex let b:deoplete_disable_auto_complete = 1
"
"" Add syntastic default settings
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 0
""let g:syntastic_check_on_wq = 0
