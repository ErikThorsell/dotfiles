set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"==============================================================="
"Plugins goes here
"Rainbow Parentheses!
Plugin 'kien/rainbow_parentheses.vim'
"Auto brackets
"Plugin 'jiangmiao/auto-pairs'
"=============================================================="
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Latex
let g:tex_flavor = "latex"

" Eye goodies
set number                      "Display line numbers.	
set ruler                       "Display the cursor position in the lower right.
syntax on                       "Syntax on (off).

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

" Highlighting
highlight ColorColumn ctermbg=101010 ctermfg=Red
let &colorcolumn=79             "Set what column to highlight.
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="78,".join(range(120,999),",")
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
"let g:AutoPairsShortcutFastWrap='' 

" Remaps
inoremap  nore  noremap
inoremap  <C-l> <Esc>:nohl<CR>          
nnoremap  <C-l> <Esc>:nohl<CR>          
inoremap  <C-r> <Esc>:RainbowParenthesesToggle<CR>
nnoremap  <C-r> <Esc>:RainbowParenthesesToggle<CR>
nnoremap  Y y$                        

" Vim split
set wmh=0                       "Don't show ruler when minimized.
