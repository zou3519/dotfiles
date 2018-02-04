set nocompatible              " be iMproved, required
filetype off                  " required

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
set nohlsearch          " don't highlight matches, too distracting

au BufNewFile,BufRead *.cu set filetype=cuda  " cuda syntax
au BufNewFile,BufRead *.cuh set filetype=cuda " cuda syntax

" ==================== Various key remaps ====================

" Remap jk to <ESC>
inoremap jk <ESC>
xnoremap jk <ESC>
if has("nvim")
  tnoremap jk <ESC>
endif

" Map leader to space
let mapleader=" "

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap <Tab> :bnext<CR>       " cycle through buffers
nnoremap <S-Tab> :bprevious<CR> " cycle through buffers

" Simulate scrolling...
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" ==================== 256 colors / 24 bit color support ====================
" Enable 256 colors where applicable
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM =="gnome-terminal"
    set t_Co=256
endif

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799
  " < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option)
  " < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" ==================== Plugin related things. ====================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'haya14busa/incsearch.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rakr/vim-one'
Plugin 'joshdick/onedark.vim'
Plugin 'icymind/NeoSolarized'
Plugin 'w0rp/ale'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'qpkorr/vim-bufkill' " Provides :BD for buffer kill
if has("nvim")
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'zchee/deoplete-jedi'
endif

" Graveyard of Plugins
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'justinmk/vim-sneak'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable incsearch.vim's highlighting when searching
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Enable deoplete
if has("nvim")
  let g:deoplete#enable_at_startup=1
endif

" <TAB>: completion for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Use ag if it exists
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" have Ack not jump to the first match by default
cnoreabbrev ag Ack!
nnoremap <Leader>a :Ack!<Space>

" one (atom) theme
set background=dark
colorscheme onedark

" airline theme
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled=1 " buffers bar

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
" make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Bindings with fzf.vim
nmap <Leader>c :Buffers<CR>
nmap <Leader>f :Ag<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

let g:ale_linters = {
\  'python': ['flake8'],
\}

" Graveyard of Plugin options
" solarized theme
" let g:solarized_termcolors=256
" set background=dark
"colorscheme solarized

" Easymotion settings
" map <Leader> <Plug>(easymotion-prefix)
" Sneak settings
" let g:sneak#label = 1

