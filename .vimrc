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
set laststatus=2
set showtabline=2
set noshowmode

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

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

"
" Key binding 
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

" Tab navigation like Firefox: only 'open new tab' works in terminal
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>


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
" nmap <leader>bl :ls<CR>
nmap <leader>s :ls<CR>

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

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

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
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

"let g:lightline.colorscheme 	 = 'ayu_mirage'
"let g:lightline.colorscheme 	 = 'PaperColor_dark'
"let g:lightline.colorscheme 	 = 'Tomorrow_Night'
"let g:lightline.colorscheme 	 = 'Tomorrow_Night_Eighties'
"let g:lightline.colorscheme 	 = 'PaperColor_light'
"let g:lightline.colorscheme 	 = 'one'
let g:lightline.colorscheme 	 = 'wombat'

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

colorscheme tender
" colorscheme onehalfdark
" colorscheme onehalflight
" colorscheme jellybeans
" colorscheme deep-space
" colorscheme deus
" colorscheme gruvbox
" colorscheme archery

"set background=light
" set background=dark
"colorscheme PaperColor

"set background=dark
"colorscheme hybrid_material
