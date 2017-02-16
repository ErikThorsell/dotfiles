""""""""""""""""""""""""""""Welcome, you are awaited"""""""""""""""""""""""""""

" Get rid of VI behaviour
set nocompatible

" File recognition
filetype plugin on
let g:tex_flavor = "latex"

" Enable tab completion
set path+=**
set wildmenu

" Eye goodies
set number                      "Display line numbers.
set ruler                       "Display the cursor position in the lower right.
"set relativenumber             "Display current line as 0 and relative numbers from that. MAY CAUSE LAG!
set showmatch
hi CursorLine   cterm=NONE ctermbg=white
hi CursorColumn cterm=NONE ctermbg=white

" Text formatting
set ignorecase                  "Ignore case in search patterns.
set smartcase                   "Override the 'ignorecase' option if the search pattern contains uppercase characters.
set incsearch                   "While typing a search command, show where the pattern, as it was typed so far, matches.
set nowrap
set linebreak
set textwidth=79

" Tabbing
set smartindent                 "Do smart autoindenting when starting a new line.
set expandtab                   "Uses spaces instead of tabs.
set shiftwidth=2
set tabstop=2                   "How many columns does a tab count for.
set list                        "Display some nonprintable characters.
set listchars=tab:.\ ,trail:-   "Select what characters to display.
set fillchars="stl:\ ,stlnc:\ ,vert:| ,fold:\
inoremap <S-Tab> <C-V><Tab>


"""""""""""""""""""""""""""""""""""Remaps"""""""""""""""""""""""""""""""""""""""
" Chose leader key for simpler mapping
let mapleader = ','
map <leader>q gqap
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"Get rid of hl in normal and insert mode
nnoremap <C-l> :nohl<CR>
inoremap <C-l> <Esc>:nohl<CR>

" Faster console access
noremap <C-t> :tabedit<Space>

"" Delete trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"" f7 to cycle spell
nnoremap <F7> :call CycleSpell()<CR>
inoremap <F7> <Esc>:call CycleSpell()<CR>a

fun! CycleSpell()
    let langs = ['', 'en', 'sv']

    let i = index(langs, &spl)
    let j = (i+1)%len(langs)
    let &spl = langs[j]

    if empty(&spl)
        set nospell
        echo "set nospell"
    else
        set spell
        echo "spelllang="&spl
    endif

endfun

" f9 to toggle paste
nnoremap <f9> :set paste!<cr>
inoremap <f9> <esc>:set paste!<cr>a

" navigate through search resulst using m and M
noremap m n
noremap M N

" use htns to navigate cursor
" noremap h h
noremap t j
noremap n k
noremap s l

"""""""""""""""""""""""""""""""End of remaps"""""""""""""""""""""""""""""""""""
" Vim split
set wmh=0                       "Don't show ruler when minimized.

" Highlighting
set hlsearch
syntax on
highlight ColorColumn ctermbg=101010 ctermfg=Red
let &colorcolumn=80
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")

let g:rbpt_colorpairs = [
\ ['brown',       'RoyalBlue3'],
\ ['Darkblue',    'SeaGreen3'],
\ ['darkgray',    'DarkOrchid3'],
\ ['darkgreen',   'firebrick3'],
\ ['darkcyan',    'RoyalBlue3'],
\ ['darkred',     'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown',       'firebrick3'],
\ ['gray',        'RoyalBlue3'],
\ ['black',       'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue',    'firebrick3'],
\ ['darkgreen',   'RoyalBlue3'],
\ ['darkcyan',    'SeaGreen3'],
\ ['darkred',     'DarkOrchid3'],
\ ['red',         'firebrick3'],
\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au bufreadpre,bufnewfile *.cf set ft=lbnf
