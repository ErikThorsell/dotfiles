" $HOME/.config/nvim/config/keys.vimrc
"
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

" make deoplete use tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Move to a variable definition using Tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

