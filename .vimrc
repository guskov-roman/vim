set number	" Показывать номера строк
syntax on	" Включить подсветку синтаксиса
set incsearch   " Поиск в процессе набора
set hlsearch	" Подсвечивание результатов поиска
set ignorecase	" умная зависимость от регистра. Детали `:h smartcase`
set smartcase
set nocompatible
set termencoding=utf8 " Кодировка текста по умолчанию utf8
set ruler	" Показывать положение курсора всё время.
set showcmd	" Показывать незавершённые команды в статусбаре
set foldenable
set foldlevel=100
set foldmethod=indent
set mouse=a
set mousemodel=popup
set hidden
set guioptions-=T " Скрыть панель в gui версии
set ch=1	 
set mousehide
set autoindent
set nowrap
highlight CursorLine guibg=lightblue ctermbg=lightgray
highlight CursorLine term=none cterm=none
set history=200
set wildmenu
set clipboard=unnamed

au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

let g:currentmode={
\ 'n'  : 'Normal',
\ 'no' : 'Normal·Operator Pending',
\ 'v'  : 'Visual',
\ 'V'  : 'V·Line',
\ '^V' : 'V·Block',
\ 's'  : 'Select',
\ 'S'  : 'S·Line',
\ '^S' : 'S·Block',
\ 'i'  : 'Insert',
\ 'R'  : 'Replace',
\ 'Rv' : 'V·Replace',
\ 'c'  : 'Command',
\ 'cv' : 'Vim Ex',
\ 'ce' : 'Ex',
\ 'r'  : 'Prompt',
\ 'rm' : 'More',
\ 'r?' : 'Confirm',
\ '!'  : 'Shell',
\ 't'  : 'Terminal'
\}

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode


hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e
