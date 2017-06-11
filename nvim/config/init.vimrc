" $HOME/.config/nvim/config/init.vimrc
"
" Make sure that vim-plug is installed
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start invoking vim-plug
call plug#begin('$HOME/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-crystal'

call plug#end()

