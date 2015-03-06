set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

<<<<<<< HEAD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I here by claim this place for my plugins accordingly
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
=======
"==============================================================="
"Plugins goes here
"Rainbow Parentheses!
Plugin 'kien/rainbow_parentheses.vim'
"Auto brackets
"Plugin 'jiangmiao/auto-pairs'
"=============================================================="
>>>>>>> Cleaning: Started cleaning process.
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
<<<<<<< HEAD
" :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Stuff:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set nocompatible
set backspace=indent,eol,start
"filetype plugin on
let g:tex_flavor = "latex"


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

let mapleader = ","

"""" Cosmetics
colorscheme monokai
syntax on
set number
set ruler
set showcmd
set splitbelow
set splitright

" Highlighting
"highlight ColorColumn ctermbg=Black ctermfg=Red
"let &colorcolumn=79             "Set what column to highlight.
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="78,".join(range(120,999),",")

"""" Tidy writing
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"""" Maps
inoremap nore noremap
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>
noremap <C-d> yyp
inoremap <C-x> <Esc>:q<CR>
nnoremap <C-x> :q<CR>
nnoremap <Enter> i<Enter>
noremap <C-t> :tabedit<Space>
"nnoremap <Space> i<Space>
"noremap <C-Left> <Esc>b
nnoremap <C-F> ggVG=

" Press f5 to insert timestamp YYYY-MM-DD_HH:MM:SS
nnoremap <F5> "=strftime("%F_%T")<CR>P
nnoremap <F5><F5> "=strftime("%F")<CR>P
inoremap <F5> <C-R>=strftime("%F_%T")<CR>
inoremap <F5><F5> <C-R>=strftime("%F")<CR>

cnoremap so<space>& so<space>%
cnoremap Q q
cnoremap qq q!
cmap te<Space> tabedit<Space>
cnoremap R<Space> .-1read<space>

" gq} for formatting current paragraph
map Q gq    
map <C-space> <Esc>

"nnoremap <C-S-o> :NERDTree<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""" Macros
nnoremap <Space> @q
=======
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

>>>>>>> Cleaning: Started cleaning process.

"Eye goodies
set number                      "Display line numbers.	
set ruler                       "Display the cursor position in the lower right.
syntax on                       "Syntax on (off).

<<<<<<< HEAD
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif


"""" Plugin helpers
" RainbowParenthesis
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
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
    \]

" auto-pairs å fix https://github.com/jiangmiao/auto-pairs/issues/88 and 93:
let g:AutoPairsShortcutFastWrap=''

"""" Don't know what this does:
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"""" TODO """""

" NERDCommenter
" fix shortcut <C-7>

" RainbowParenthesis toggle
"nnoremap <C-S-r> :RainbowParenthesesToggle<CR>

"autocmd FileType text setlocal textwidth=78

=======
"Text formatting
set ignorecase		            "Ignore case in search patterns.
set smartcase		            "Override the 'ignorecase' option if the 
                                "search pattern contains uppercase characters.
set incsearch		            "While typing a search command, show where 
                                "the pattern, as it was typed so far, matches.

"Tabbing
set smartindent		            "Do smart autoindenting when starting a new line.
set expandtab                   "Uses spaces instead of tabs.
set shiftwidth=4
set tabstop=4                   "How many columns does a tab count for.

"Highlighting
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

"Remaps
inoremap  nore  noremap
inoremap  <C-l> <Esc>:nohl<CR>          
nnoremap  <C-l> <Esc>:nohl<CR>          
inoremap  <C-r> <Esc>:RainbowParenthesesToggle<CR>
nnoremap  <C-r> <Esc>:RainbowParenthesesToggle<CR>
nnoremap  Y y$                        

"Vim split
set wmh=0                       "Don't show ruler when minimized.
>>>>>>> Cleaning: Started cleaning process.
