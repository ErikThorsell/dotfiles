" enable tabline and statusline
set tabline="%1T"
set laststatus=2

"disable showmode
set noshowmode

" set colors to use | color table -> http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html
hi Mode             gui=Bold   guifg=red3     guibg=bg
hi Numbers          gui=Bold   guifg=fg       guibg=bg
hi BufferAndWindow  gui=None   guifg=fg       guibg=bg
hi GitInfo          gui=Bold   guifg=magenta  guibg=bg
hi FilePath         gui=None   guifg=gray     guibg=bg
hi FileType         gui=None   guifg=gray     guibg=bg
hi Divider          gui=Bold   guifg=#458588  guibg=bg
hi Space            gui=None   guifg=bg       guibg=bg
hi Warning          gui=Bold   guifg=fg       guibg=red

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

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
set statusline+=%#FilePath#\ %<%t\                                  " file path
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
set statusline+=%#FileType#\ %-3(%{FileSize()}%)                    " file size
"set statusline+=\(%{WordCount()}\ w)                                " word count in latex files
set statusline+=%#Numbers#\%4l\/%-4L\                               " row/rownr
set statusline+=%#Numbers#\%3c\                                     " columnnr
