" Latex
let g:tex_flavor = "latex"

" Eye goodies
set number                      "Display line numbers.	
set ruler                       "Display the cursor position in the lower right.
set showmatch

" Text formatting
set ignorecase		            "Ignore case in search patterns.
set smartcase		            "Override the 'ignorecase' option if the 
                                "search pattern contains uppercase characters.
set incsearch		            "While typing a search command, show where 
                                "the pattern, as it was typed so far, matches.

" Tabbing
set smartindent		            "Do smart autoindenting when starting a new line.
set expandtab                   "Uses spaces instead of tabs.
set shiftwidth=4
set tabstop=4                   "How many columns does a tab count for.
set list                        "Display some nonprintable characters.
set listchars=tab:.\ ,trail:-   "Select what characters to display.
set fillchars="stl:\ ,stlnc:\ ,vert:| ,fold:\

" Line wrapping
set nowrap
set linebreak
set textwidth=79


" Remaps
inoremap  nore  noremap
inoremap  <C-l> <Esc>:nohl<CR>          
nnoremap  <C-l> <Esc>:nohl<CR>          
"inoremap  <C-R> <Esc>:RainbowParenthesesToggle<CR>
"nnoremap  <C-R> <Esc>:RainbowParenthesesToggle<CR>
nnoremap  Y y$                        

" Vim split
set wmh=0                       "Don't show ruler when minimized.

" Highlighting
syntax on                       "Syntax on (off).
highlight ColorColumn ctermbg=101010 ctermfg=Red
let &colorcolumn=80             "Set what column to highlight.
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
set hlsearch		            "Enables highlighting while searching.
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

