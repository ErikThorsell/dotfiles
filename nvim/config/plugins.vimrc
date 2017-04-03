" $HOME/.config/nvim/config/plugins.vimrc
"
" File recognition
filetype plugin indent on
let g:tex_flavor = "latex"


" Invoke deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1 " <-- if you want to disable autocomplete
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Invoke tern
if exists('g:plugs["tern_for_vim"]')
    let g:tern#command = ['tern']
    let g:tern#arguments = ['--persistent']
    let g:tern_request_timeout = 1
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

