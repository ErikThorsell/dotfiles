" $HOME/.config/nvim/config/plugins.vimrc
"
" File recognition
filetype plugin indent on
let g:tex_flavor = "latex"

" Invoke deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 1 " set to 1 if you want to disable autocomplete
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

