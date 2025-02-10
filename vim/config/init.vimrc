" Make sure that vim-plug is installed
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start invoking vim-plug
call plug#begin('$HOME/.vim/plugged')

" Addons
Plug 'tpope/vim-fugitive'           " The best Git wrapper of all time

" Coding
Plug 'vim-syntastic/syntastic'      " Syntax error help

" Navigation
Plug 'scrooloose/nerdtree'          " NerdTREE
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git support for NerdTREE

" Visuals
Plug 'morhetz/gruvbox'              " Gruvbox color scheme
"Plug 'tmhedberg/SimpylFold'        " Folding for Python
"Plug 'Konfekt/FastFold'            " Increase folding performance

" Vim Wiki
Plug 'vimwiki/vimwiki'

call plug#end()

