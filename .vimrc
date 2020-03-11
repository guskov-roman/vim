syntax on	
set number	
set scrolloff=3
set wrap
set showmatch
set autoread
set confirm 
set noswapfile
set incsearch 
set hlsearch	
set ignorecase	
set smartcase
set nocompatible
set termencoding=utf8 
set ruler	
set showcmd	
set foldenable
set foldlevel=100
set foldmethod=indent
set mouse=a
set mousemodel=popup
set hidden
set guioptions-=T 
set ch=1	 
set mousehide
set autoindent
set nowrap
highlight CursorLine guibg=lightblue ctermbg=lightgray
highlight CursorLine term=none cterm=none
set history=200
set wildmenu
set clipboard=unnamedplus
" set clipboard=unnamed
set t_Co=256
set splitbelow

set backspace=indent,eol,start


" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=green
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=green

if executable("xsel")

  function! PreserveClipboard()
    call system("xsel -ib", getreg('+'))
  endfunction

  function! PreserveClipboadAndSuspend()
    call PreserveClipboard()
    suspend
  endfunction

  autocmd VimLeave * call PreserveClipboard()
  nnoremap <silent> <c-z> :call PreserveClipboadAndSuspend()<cr>
  vnoremap <silent> <c-z> :<c-u>call PreserveClipboadAndSuspend()<cr>

endif

" Key binding 
"
" Disable Replace Mode
" imap <Insert> <Nop>
" inoremap <S-Insert> <Insert>

" Search in Text Ctrl+R
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>

" Save file F2
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

nmap <F3> :noh<cr>

nnoremap <C-PageUp> :tabprevious<CR>
nnoremap <C-PageDown> :tabnext<CR>

" Copy in system buffer
vnoremap <C-C> "+y
map <C-V>      "+gP

vmap <Tab> >gv
vmap <S-Tab> <gv

vnoremap p "_dP

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

let mapleader = ","
" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Plugins o:
filetype plugin on

" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins to install
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
" Optional
Plug 'vim-airline/vim-airline-themes'

" Color scheme
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'

" Browse the file system
Plug 'scrooloose/nerdtree'

" Ctrlp
Plug 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call plug#end()

" ------------------------------------------------------------------------------ "
" 				Pugins settings" 				 "
" ------------------------------------------------------------------------------ "
"
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_highlighting_cache = 1
let g:airline_section_warning=' '

" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode

" ------------------------------ Nerdtree  ------------------------------------
let NERDTreeShowHidden=1
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree

" ------------------------------------------------------------------------------ "
" 				Color scheme" 				 	 "
" ------------------------------------------------------------------------------ "

" let g:airline_theme='angr'
" let g:airline_theme='tender'
let g:airline_theme='onehalfdark'
" let g:airline_theme='onehalflight'

"colorscheme tender
"colorscheme onehalfdark
"colorscheme onehalflight
"colorscheme jellybeans
colorscheme PaperColor

" set background=dark
" colorscheme hybrid_material
