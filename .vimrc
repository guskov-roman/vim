set number	" Показывать номера строк
syntax on	" Включить подсветку синтаксиса
set scrolloff=3
set wrap
set linebreak
set showmatch
set autoread
set confirm 
" set virtualedit=all " Erlauben in auserhalb der Zeile ausgehen
set noswapfile
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
set t_Co=256

xnoremap p pgvy
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
filetype plugin indent on
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline#extensions#tabline#enabled = 1

" :let g:airline_theme='base16_ashes'

" Settings Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
