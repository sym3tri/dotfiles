set clipboard+=unnamedplus

"------------------------------------------------------------------------------
" GENERAL CONFIG
"------------------------------------------------------------------------------
" set nocompatible
" help language should be English
set helplang=en
" lang to use for menu translations
set langmenu=none
" make backspace work normally on *NIX systems
set backspace=indent,eol,start
" always save as utf-8
set fileencodings=utf-8
set termencoding=utf-8
" Enable filetype detection
filetype on
" filetype off
" load filetype specific plugins
filetype plugin on
" different indentation by filetype
filetype indent on
" Set to auto read when a file is changed from the outside
set autoread
" dont wrap text
set nowrap
" show line numbers
set number
" show column position
set ruler
" ignore case when searching
set ignorecase
" dont ignore case if capital letters are present
set smartcase
" highlight searched things
set hlsearch
" highlight search chars as they are types
set incsearch
" no error bells
set noerrorbells
" Allow specified keys that move the cursor left/right to move to the prev/next line
set whichwrap+=h,l
" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

" CODE FOLDING
" fold based on indent
set foldmethod=indent
" deepest fold is 10 levels
set foldnestmax=10
" no fold by default
set nofoldenable
set foldlevel=1

" Persistent undo
set undodir=~/.vim_runtime/undodir
set undofile

" TABS
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set smartindent

" STATUS LINE
" Show current git branch
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set listchars+=trail:·
set listchars+=nbsp:f
" use the OS clipboard
"set clipboard=unnamed

" Maintain more context around the cursor
set scrolloff=3

set updatetime=250

"------------------------------------------------------------------------------
" COLORS
"------------------------------------------------------------------------------
" syntax highlighting
syn on
" Higlight current line only in insert mode
" autocmd InsertLeave * set nocursorline
" autocmd InsertEnter * set cursorline
" Invisible character colors
highlight NonText guifg=#236360
highlight SpecialKey guifg=#044A46
" Warning for beyond the 80th column
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

colorscheme jellybeans

"------------------------------------------------------------------------------
" Functions
"------------------------------------------------------------------------------
" function to strip all trailing spaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Jump to the last position of a file when opening it again
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

"------------------------------------------------------------------------------
" SHORTCUT KEY MAPPINGS
"------------------------------------------------------------------------------
" Set <leader> to comma
let mapleader=","
" clear search highlights
noremap <silent><Leader>/ :nohls<CR>
" shortcut to change windows (and maximize if up/down)
map <C-H> <C-w>h
map <C-L> <C-w>l
map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>j<C-W>_

" map easier shortcut for switching tabs
noremap <leader>j :tabp<CR>
noremap <leader>k :tabn<CR>

" Shortcut to rapidly toggle `set list` which will show/hide hidden chars
nmap <leader>l :set list!<CR>
set list
" map shourtcut to trim all trailing to: \$
nmap <silent> <leader>$ :call <SID>StripTrailingWhitespaces()<CR>
" Shortcut to initialize edit command in dir of current file
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
" Shortcut to toggle spellchecker
nmap <silent> <leader>s :set spell!<CR>
" Force Saving Files that Require Root Permission
cmap w!! %!sudo tee > /dev/null %

" Resize vertical splits more easily
" TODO: fix this
"nmap <silent><leader>\> 4<c-w>\>
"nmap <silent><leader>\> 4<c-w>\>
" Resize horizontal splits more easily
nmap <silent><Leader>- 4<c-w>-
nmap <silent><Leader>= 4<c-w>+

"------------------------------------------------------------------------------
" MACROS
"------------------------------------------------------------------------------
" surround with double quotes
let @q = 'ciw"""B'
nmap <leader>" @q

" surround with single quotes
let @w = 'ciw''"''B'
nmap <leader>' @w


"------------------------------------------------------------------------------
" FUNNY FILE TYPES
"------------------------------------------------------------------------------
" use 4 space tabs for python files
au FileType python setl tabstop=4
au FileType python setl shiftwidth=4

" specify syntax language for non-standard file types
au BufReadPost *.less set syntax=css
au BufReadPost *.scss set syntax=css

"------------------------------------------------------------------------------
" GOLANG
"------------------------------------------------------------------------------
" Go files use tabs
au FileType go setl tabstop=4
au FileType go setl shiftwidth=4
au FileType go setl noexpandtab

" use all golang plugins
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
"autocmd FileType go autocmd BufWritePre <buffer> Fmt

" disable auto fmt on save
let g:go_fmt_autosave = 0
" shortcut for gofmt
nmap <leader>f :GoFmt<CR>

"------------------------------------------------------------------------------
" PLUGINS
"------------------------------------------------------------------------------
" https://github.com/junegunn/vim-plug
" Reload .vimrc and :PlugInstall to install plugins.

call plug#begin('~/.local/share/nvim/plugged')
    " Frequently used
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Sometimes used
    Plug 'docunext/closetag.vim'
    Plug 'msanders/snipmate.vim'
    Plug 'fatih/vim-go'
    Plug 'leafgarland/typescript-vim'
    Plug 'jelera/vim-javascript-syntax'
    Plug 'hashivim/vim-terraform'

    "Plug 'tpope/vim-fugitive'
    "Navigate & Manage marks
    "Plug kshenoy/vim-signature
call plug#end()


"------------------------------------------------------------------------------
" PLUGIN CONFIG
"------------------------------------------------------------------------------
" NERDTREE
let NERDTreeShowHidden=1
nmap <leader>nn :NERDTree<CR>
nmap <leader>nr :NERDTreeMirror<CR>
nmap <leader>nf :NERDTreeFind<CR>
nmap <leader>nc :NERDTree<CR><C-w>p:NERDTreeFind<CR>
" hide files from NERDTree
let NERDTreeIgnore = ['\.DS_Store$']

