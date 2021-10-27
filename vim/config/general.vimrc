" Eye goodies
set number                      "Display line numbers.
set ruler                       "Display the cursor position in the lower right.
set termguicolors               " Get nice colors!
"set relativenumber             "Display current line as 0 and relative numbers from that. MAY CAUSE LAG!
set showmatch
hi CursorLine   cterm=NONE ctermbg=Black
hi CursorColumn cterm=NONE ctermbg=Black

" Text formatting
set ignorecase                  "Ignore case in search patterns.
set smartcase                   "Override the 'ignorecase' option if the search pattern contains uppercase characters.
set incsearch                   "While typing a search command, show where the pattern, as it was typed so far, matches.
set nowrap
set linebreak
set textwidth=80

" Tabbing
"set smartindent                 "Do smart autoindenting when starting a new line.
set expandtab                   "Uses spaces instead of tabs.
set shiftwidth=4
set tabstop=4                   "How many columns does a tab count for.
set list                        "Display some nonprintable characters.
set listchars=tab:.\ ,trail:-   "Select what characters to display.
set fillchars="stl:\ ,stlnc:\ ,vert:| ,fold:\
inoremap <S-Tab> <C-V><Tab>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Use an undo directory
set undodir=$HOME/.vim/undodir
set undofile
set undolevels=100
set undoreload=1000

" Do NOT enable mouse
set mouse=c

" Vim split
set wmh=0                       "Don't show ruler when minimized.

" Highlighting
set t_Co=256
set hlsearch

" Syntax
syntax enable

" Mark where 80 and 119 c are
highlight ColorColumn guifg=red
let &colorcolumn=81
let &colorcolumn=join(range(82,999),",")
let &colorcolumn="81,".join(range(120,999),",")

" Change of Spell* behave
hi clear SpellBad
hi SpellBad cterm=underline,bold guifg=red
hi clear SpellCap
hi SpellCap cterm=underline,bold guifg=blue

" detect .md as markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" stop highlighting of underscores in markdown files
autocmd BufNewFile,BufRead,BufEnter *.md,*.markdown :syntax match markdownIgnore "_"

" close vim if NERDTree is the only buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
