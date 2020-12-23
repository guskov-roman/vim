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
set history=1000
set wildmenu
set clipboard=unnamedplus
" set clipboard=unnamed
set t_Co=256
set splitbelow
set backspace=indent,eol,start
set laststatus=2
set showtabline=2
set noshowmode
" set undofile

" set omnifunc=syntaxcomplete#Complete
set tags+=~/.vim/tags/cpp
" set completeopt=longest
" set completeopt=longest,menuone


" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" " automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"


" ##############################################################################
" 			    Linux Kernel Development
" ##############################################################################


set colorcolumn=100
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" ##############################################################################
" 				Color Settings
" ##############################################################################
"
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
     set termguicolors
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" ##############################################################################
" 			Copy-Paste Setting with xsel
" ##############################################################################

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

" ##############################################################################
" 				Key binding 
" ##############################################################################

" search text under cursor 
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
"
nmap <c-f> :cs find g <c-r>=expand("<cword>")<cr><cr>

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
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-t>     <Esc>:tabnew<CR>
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" Copy in system buffer
vnoremap <C-C> "+y
map <C-V>      "+gP

vmap <Tab> >gv
vmap <S-Tab> <gv

vnoremap p "_dP

nnoremap s "_d

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" ##############################################################################
" 				Buffer Management
" ##############################################################################

let mapleader = ","
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

" ##############################################################################
" 				 Plugins Setting
" ##############################################################################
 				 
"
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

Plug 'morhetz/gruvbox'

Plug 'jlanzarotta/bufexplorer'

" Color scheme
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'

" Browse the file system
Plug 'scrooloose/nerdtree'

" Ctrlp
Plug 'kien/ctrlp.vim'

Plug 'dr-kino/cscope-maps'
Plug 'vim-scripts/OmniCppComplete'

Plug 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call plug#end()


" ############################################################################## 
" 				Pugins settings" 				 
" ############################################################################## 


" Lightline Settings

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

let g:lightline#bufferline#show_number  = 2
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

" ############################################################################## 
" 				Ctrlp Settings					 
" ############################################################################## 
"
" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

nmap <leader>p :CtrlP<cr>  " enter file search mode

" ##############################################################################
" 				Nerdtree Settings 
" ##############################################################################
 
let NERDTreeShowHidden=1
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree
autocmd BufEnter * lcd %:p:h


" ##############################################################################
" 				cscope settings
" ############################################################################## 

if has("cscope")
set csprg=/usr/bin/cscope
	 "Specify: the search order of cstag. 0 means search the cscope database first, if it does not match, search for the tag file again, 1
	 "On the contrary
	set csto=0
	 ":tag/Ctrl-]/vim -t will use :cstag instead of the default :tag
	set cst
	 "+ (append the result to the quickfix window),-(clear the last result), 0 (do not use quickfix. Not specified is equivalent to flag 0)))
	" set cscopequickfix=s-,c-,d-,i-,t-,e- "Use the QuickFix window to display cscope search results
	set nocsverb "When adding cscope database, success or failure information will not be printed
	set cspc=3 " Specify how many levels of file paths are displayed in the search results, the default value 0 means display the full path, 1 means only display the file name"
	if filereadable("cscope.out")
		cs add $PWD/cscope.out $PWD
		"cs add cscope.out
	 "else" subdirectory opens, search upwards
		let cscope_file=findfile("cscope.out", ".;")
		let cscope_pre=matchstr(cscope_file, ".*/")
		if !empty(cscope_file) && filereadable(cscope_file)
			exe "cs add" cscope_file cscope_pre
		endif
	endif
	set nocsverb
endif

" ##############################################################################
" 				Color Scheme Settings
" ############################################################################## 

" let g:gruvbox_contrast_light = 'hard'
" let g:gruvbox_italic = 1
" colorscheme gruvbox
" set bg=dark
" set background=dark

" colorscheme solarized8
" colorscheme solarized8_flat
" colorscheme solarized8_low
" colorscheme solarized8_high

" colorscheme tender
" colorscheme onehalfdark
" colorscheme onehalflight
" colorscheme jellybeans
" colorscheme deep-space
" colorscheme deus
" colorscheme archery

" set background=light
" colorscheme PaperColor

set background=dark
let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1
colorscheme hybrid_material
" 
" ############################################################################## 
