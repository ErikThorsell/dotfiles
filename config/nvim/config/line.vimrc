" $HOME/.config/nvim/config/line.vimrc
"
" all status line configuration goes here
"set cmdheight=1
"set display+=lastline
"
"" general config
"set laststatus=2        " always show status line
"set showtabline=2       " always show tabline
"set noshowmode          " hide default mode text (e.g. INSERT) as airline already displays it
"
"" airline config
"let g:airline#extensions#tabline#enabled = 1        " buffers at the top as tabs
"let g:airline#extensions#tabline#show_tabs = 0      " puts ``tab m/n'' instead of name of tab in right corner
"let g:airline#extensions#tabline#show_tab_type = 0  " disallows ``buffers'' to appear in top right corner
"let g:airline#extensions#tabline#show_splits = 0    " display open splits per tab
"
"
"" symbols
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.readonly = ''


"statusline

hi StatusLine term=bold cterm=bold ctermfg=White ctermbg=235
hi StatusEnd term=bold cterm=bold ctermfg=107 ctermbg=235 guifg=#799d6a
hi StatusGitBranch term=bold cterm=bold ctermfg=215 ctermbg=235 guifg=#ffb964

function! MyGitBranchStyle()
    let branch = GitBranch()
    if branch == ''
        let branchStyle = ''
    else
        let branchStyle = 'git:' . branch
    end
    return branchStyle
endfunction

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

set laststatus=2
"set statusline=%#StatusLine#%F%h%m%r\ %h%w%y\ col:%c\ lin:%l\,%L\ buf:%n\ win:%{WindowNumber()}\ reg:%{v:register}\ %#StatusGitBranch#%{MyGitBranchStyle()}\ \%=%#StatusLine#%{strftime(\"%d/%m/%Y-%H:%M\")}\ %#StatusHostname#%{hostname()}
"set statusline=%#StatusLine#%F%h%m%r\ %h%w%y\ %=%#StatusGitBranch#%{MyGitBranchStyle()}\ \%=col:%c\ lin:%l\,%L\ buf:%n\ win:%{WindowNumber()}\ reg:%{v:register}}
set statusline=%#StatusLine#%F%h%m%r\ %=%#StatusGitBranch#%{MyGitBranchStyle()}\ \%=%#StatusEnd#col:%c\ lin:%l\/%L\ buf:%n\ win:%{WindowNumber()}\ reg:%{v:register}

