set number	
set background=dark
set termguicolors
" set color themes ayu
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
" 
" colorscheme deep-space
" colorscheme jellybeans
syntax on	
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
" set t_te=
" set t_ti=
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


" hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User1 ctermfg=007 ctermbg=239 guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007 ctermbg=236 guibg=#303030 guifg=#adadad
hi User3 ctermfg=236 ctermbg=236 guibg=#303030 guifg=#303030
hi User4 ctermfg=239 ctermbg=239 guibg=#4e4e4e guifg=#4e4e4e

" Key binding 
" Search in Text Ctrl+R
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>

" Save file F2
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

set pastetoggle=<F3>

" nnoremap <C-PageUp> :tabprevious<CR>
" nnoremap <C-PageDown> :tabnext<CR>

" Copy in system buffer
vnoremap <C-C> "+y
map <C-V>      "+gP

vmap <Tab> >gv
vmap <S-Tab> <gv

vnoremap p "_dP
" Plugins o:

filetype plugin on


if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
