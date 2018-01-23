" $HOME/.config/vim/config/init.vimrc
"
" Make sure that vim-plug is installed
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start invoking vim-plug
call plug#begin('$HOME/.vim/plugged')

Plug 'tpope/vim-fugitive'            " The best Git wrapper of all time
"Plug 'tmhedberg/SimpylFold'         " Folding for Python
"Plug 'Konfekt/FastFold'             " Increase folding performance
Plug 'vim-syntastic/syntastic'       " Syntax error help
"Plug 'vim-airline/vim-airline'

call plug#end()

