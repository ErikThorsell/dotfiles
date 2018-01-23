"statusline

" enable tabline and statusline
set tabline="%1T"
set laststatus=2

"disable showmode
set noshowmode

" set colors to use | color table -> http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
hi Mode             term=bold cterm=bold ctermfg=190   ctermbg=235
hi Numbers          term=bold cterm=bold ctermfg=15    ctermbg=235
hi BufferAndWindow  term=None cterm=None ctermfg=15    ctermbg=235
hi GitInfo          term=Bold cterm=Bold ctermfg=198   ctermbg=235
hi FilePath         term=None cterm=None ctermfg=7     ctermbg=235
hi FileType         term=None cterm=None ctermfg=7     ctermbg=235
hi Divider          term=Bold cterm=Bold ctermfg=198   ctermbg=235
hi Space            term=None cterm=None ctermfg=None  ctermbg=235
hi Warning          term=Bold cterm=Bold ctermfg=0     ctermbg=Red

" Find out current buffer's size and output it.
"function! FileSize()
"  let bytes = getfsize(expand('%:p'))
"  if (bytes >= 1024)
"    let kbytes = bytes / 1024
"  endif
"  if (exists('kbytes') && kbytes >= 1000)
"    let mbytes = kbytes / 1000
"  endif
"
"  if bytes <= 0
"    return '0'
"  endif
"
"  if (exists('mbytes'))
"    return mbytes . 'MB '
"  elseif (exists('kbytes'))
"    return kbytes . 'KB '
"  else
"    return bytes . 'B '
"  endif
"endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ''.fugitive#head().''
  else
    return ''
endfunction

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

" `Smart` wordcount (works for LaTeX)
"let g:word_count="<unknown>"
"function! WordCount()
"    return g:word_count
"endfunction

"function! UpdateWordCount()
"    let filename = expand("%")
"    let cmd = "detex " . filename . " | wc -w | tr -d '[:space:]'"
"    let result = system(cmd)
"    let g:word_count = result
"endfunction

"set updatetime=1000
"augroup WordCounter
"    au! CursorHold,CursorHoldI * call UpdateWordCount()
"augroup END

set statusline =
set statusline+=%#Mode#\%3{toupper(mode())}\                        " current mode
set statusline+=%#Divider#\|                                        " divider
set statusline+=%#BufferAndWindow#\ b:%n\                           " buffernr
set statusline+=%#BufferAndWindow#\ w:%{WindowNumber()}\            " windownr
set statusline+=%#Divider#\|                                        " divider
set statusline+=%#FilePath#\ %<%F\                                  " file path
set statusline+=%#FilePath#\ %4m\                                   " modified
set statusline+=%#Space#\ %=                                        " space
" added from syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" end added from syntastic
set statusline+=%#Space#\ %=                                        " space
set statusline+=%#GitInfo#\ %{GitInfo()}\                           " git
set statusline+=%#Space#\ %=                                        " space
set statusline+=%#FileType#\ %y\                                    " file type
set statusline+=%#FileType#\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\    " encoding & fileformat
"set statusline+=%#FileType#\ %-3(%{FileSize()}%)                    " file size
"set statusline+=\(%{WordCount()}\ w)                                " word count in latex files
set statusline+=%#Numbers#\%4l\/%-4L\                               " row/rownr
set statusline+=%#Numbers#\%3c\                                     " columnnr
