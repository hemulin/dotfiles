execute pathogen#infect()

set t_Co=256

syntax on
set tabstop=4
set shiftwidth=4
set autoindent
set number
"set foldmethod=syntax

nmap <C-h> :diffget LOCAL<CR>
nmap <C-l> :diffget REMOTE<CR>
nmap <C-k> [c
nmap <C-j> ]c

" Copy to clipboard
:nnoremap <leader>y "+y
" Copy to clipboard in visual mode
:xnoremap <leader>y "+y

set incsearch
set hlsearch

" Preserve clipboard content format
set paste

set noruler
set laststatus=2

hi User1 guifg=#ffdad8  guibg=#880c0e ctermfg=1
hi User2 guifg=#000000  guibg=#F4905C ctermfg=2
hi User3 guifg=#292b00  guibg=#f4f597 ctermfg=3
hi User4 guifg=#112605  guibg=#aefe7B ctermfg=4
hi User5 guifg=#051d00  guibg=#7dcc7d ctermfg=5
hi User7 guifg=#ffffff  guibg=#880c0e ctermfg=6 gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb ctermfg=7
hi User9 guifg=#ffffff  guibg=#810085 ctermfg=8
hi User0 guifg=#ffffff  guibg=#094afe ctermfg=9

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

set mouse=a
