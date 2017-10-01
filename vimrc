set nocompatible              " be iMproved, required
filetype off                  " required

inoremap jk <ESC>             " map jk to esc
let mapleader=" "             " map leader to space

" Colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM =="gnome-terminal"
    set t_Co=256
endif

syntax on

set wildmenu
set number              " add line numbers
set ruler
set cursorline          " add highlighter of what line on
set visualbell

set showcmd             " show partial command in status line
set showmatch           " show matching brackets
set ignorecase          " do case insensitive matching 

" make TAB = 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab           " convert tab to spaces
set backspace=indent,eol,start
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set laststatus=2

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

nnoremap <Tab> :bnext<CR>       " cycle through buffers
nnoremap <S-Tab> :bprevious<CR> " cycle through buffers

au BufNewFile,BufRead *.cu set filetype=cuda " cuda syntax
au BufNewFile,BufRead *.cuh set filetype=cuda" cuda syntax

" ==================== Plugin related things. ==================== 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'w0rp/ale'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Easymotion settings
map <Leader> <Plug>(easymotion-prefix)

" solarized theme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" airline theme
let g:airline_theme='zenburn'

let g:airline#extensions#tabline#enabled=1 " buffers bar

" NERDTree config
" Open always when entering vi without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Shortcut to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>
" make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ctrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
