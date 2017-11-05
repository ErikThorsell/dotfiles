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

Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-crystal'
Plug 'amjith/git-vim'
Plug 'tmhedberg/SimpylFold'         " Folding for Python
"Plug 'Shougo/deoplete.nvim'
"Plug 'Konfekt/FastFold'             " Increase folding performance
"Plug 'vim-syntastic/syntastic'
"Plug 'vim-airline/vim-airline'

call plug#end()

