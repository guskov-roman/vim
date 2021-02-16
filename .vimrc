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
set history=1000
set wildmenu
set t_Co=256
set splitbelow
set backspace=indent,eol,start
set laststatus=2
set showtabline=2
set noshowmode
set clipboard=unnamedplus

" ##############################################################################
" 				 Plugins setting
" ##############################################################################

filetype plugin on

" ----------------------------------------------------------------------------- 
" 				OmniCppCompletion plugin
" ----------------------------------------------------------------------------- 

" Enable OmniCompletion
" http://vim.wikia.com/wiki/Omni_completion
set omnifunc=syntaxcomplete#Complete

" Configure menu behavior
" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use Ctrl+Space for omni-completion
" http://stackoverflow.com/questions/510503/ctrlspace-for-omni-and-keyword-completion-in-vim
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
  \ "\<lt>C-n>" :
  \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
  \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
  \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black

let OmniCpp_GlobalScopeSearch = 1 	" enable global scope search
let OmniCpp_ShowPrototypeInAbbr = 1	" show function parameters
let OmniCpp_ShowAccess = 1 		" show access information in pop-up menu
let OmniCpp_MayCompleteDot = 1 		" auto complete after '.'
let OmniCpp_MayCompleteArrow = 1 	" auto complete after '->'
let OmniCpp_MayCompleteScope = 0 	" auto complete after '::'
let OmniCpp_SelectFirstItem = 0 	" don't select first item in pop-up menu

" ----------------------------------------------------------------------------- 
" 				 Plug autoload
" ----------------------------------------------------------------------------- 

" automatically downloads vim-plug to your machine if not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins to install
call plug#begin('~/.vim/plugged')

" Browse the file system
Plug 'scrooloose/nerdtree'

" Ctrlp
Plug 'kien/ctrlp.vim'
Plug 'dr-kino/cscope-maps'
Plug 'ronakg/quickr-cscope.vim'
Plug 'preservim/tagbar'
Plug 'craigemery/vim-autotag'

" Color scheme
Plug 'jacoborus/tender.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'morhetz/gruvbox'

" Lightline status line and buffer
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()


" ##############################################################################
" 			   Key binding  
" ##############################################################################

let mapleader = ","

" Clipboard settings

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> 	    "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>  "+gP

cmap <C-V>      <C-R>+
cmap <S-Insert> <C-R>+

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

nmap <F3> :noh<cr>
nmap <F8> :TagbarToggle<CR>

" ############################################################################## 
" 				Lightline Settings					 
" ############################################################################## 

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

" nmap <leader>p :CtrlP<cr>  " enter file search mode

" ##############################################################################
" 				Nerdtree Settings 
" ##############################################################################
 
let NERDTreeShowHidden=1
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
" nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree
autocmd BufEnter * lcd %:p:h


" ##############################################################################
" 			    Linux kernel development
" ##############################################################################

set colorcolumn=100
highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" ##############################################################################
" 				Cscope and ctags settings
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
" 				Color settings
" ##############################################################################
"
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
     set termguicolors
endif

" ##############################################################################
" 				Buffer management
" ##############################################################################

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
" 				 Set color schema
" ##############################################################################

set background=dark
let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1
colorscheme hybrid_material

