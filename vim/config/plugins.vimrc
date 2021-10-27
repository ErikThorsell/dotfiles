" File recognition
filetype plugin indent on
let g:tex_flavor = "latex"

" Add syntastic default settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ '\mDelete this space to maintain correct pagereferences',
        \ '\mDots should be \\ldots in',
        \ '\mIntersentence spacing (\`\\@',
        \ '\mmissing \`\\@',
        \ '\mYou should enclose the previous parenthesis with',
        \ ] }

" Flake8 specific changes can be found in ~/.config/flake8

" Colorscheme
let g:gruvbox_italic=1               " enable italics
let g:gruvbox_color_column='bg0'     " change color of color column
set background=dark
"set background=light

colorscheme gruvbox                  " enable scheme

" NERDTree git labels
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
