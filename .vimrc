set nocompatible
filetype on

" ================ VUNDLE ============================ {{{
"
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
"Plugin 'plasticboy/vim-markdown'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'godlygeek/tabular'
"
Plugin 'VundleVim/Vundle.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'aklt/plantuml-syntax'
Plugin 'freitass/todo.txt-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required


filetype plugin indent on    " required

"}}}
"
" ================ GENERAL CONFIG ==================== {{{
"

set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set autoread                    " Reload files changed outside vim
set showmatch                   " Highlight matching [{()}]
set nostartofline               " Prevent changing current column
set mouse=a                     " Enable use of the mouse for all modes
set t_Co=256                    " This is may or may not needed.
colorscheme PaperColor
let g:airline_theme='papercolor'


let g:plantuml_executable_script='java -jar /d/plantUML/plantuml.jar'


set hidden                      " Allow hidden buffers
set encoding=utf-8


" Automatic reloading vimrc file
autocmd! bufwritepost .vimrc source %

"}}}

" ================ USER INTERFACE ==================== {{{
"
" set lines=35 columns=80         " Open with a given size
let maplocalleader=","
let mapleader=","

set background=light
set clipboard=unnamed
set cmdheight=2                 " Set the command window height to 2 lines 
set cursorline
set display=lastline            " Something instead @
set colorcolumn=80              " Sed a colored column at 70 to avoid going to far to the right
set laststatus=2                " Status bar
set numberwidth=5
set ruler                       " Show the cursor position all the time
set showmode                    " Show current mode down the bottom
set showcmd                     " Show incomplete cmds down the bottom
set number relativenumber       " Line numbers in relative moved
set fileformats=dos
set fileformat=dos

"}}}

" =============== SYNTAX HIGHLIGHT =========== {{{
"
"
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END
" }}}

" =============== TABLES ===================== {{{

"let g:table_mode_corner='+'
"let g:table_mode_header_fillchar='='

let g:table_mode_corner='|'    " This is for vim-table-mode

"
"}}}


" ================ SCROLLING  ======================== {{{

set scrolloff=5                 " Scrolling before and after X lines away from margins
set sidescrolloff=1             " Same but horizontal
set sidescroll=0

"}}}

" ================ TEXT WRAPPING ===================== {{{
"
"
"set showbreak=+               " Show '+' on beginning of each wrapped line. Only if :set wrap is ON.
set formatoptions-=t            " Auto-wrapping OFF.':set formatoptions+=t' will turn autowrapping back on
set nowrap                      " Hard-wrap. Don't wrap lines. Opposite is ':set wrap'
set textwidth=0                 " Disable auto wrapping
set wrapmargin=0                " Disalble auto wrapping

"set wrap                      " Soft wrap
"set linebreak                  " Wrap lines at convenient points (first space from left)
"set textwidth=80              " Wrap lines automatically at 80th column
"set formatoptions-=t
syntax on                       " Coloring of syntax

"}}}

"================ TEXT FOLDING ====================== {{{

"set foldmarker={{{,}}}
"set foldmethod=manual

"set foldcolumn=6
"let g:markdown_folding = 1
"let g:markdown_enable_folding = 1

"}}}

" ================ SPACES & TABS ===================== {{{

"set noexpandtab
set autoindent

set expandtab                   " Dont use SPACEs instead of TABs
set smartindent
set smarttab
set shiftwidth=4                " Set indentation depth to X columns
set softtabstop=4               " Backspacing over X spaces like over tabs
set tabstop=4                   " Set tabulator length to X columns

" copy indent from previous line: useful when using tabs for indentation
" and spaces for alignment
set copyindent

"}}}

" ================ SEARCH ============================ {{{

set incsearch                   " Search as you type
set hlsearch                    " Highlight matches
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...unless we type a capital

"}}}

" ================ SHOW HIDDEN CHARACTERS ============ {{{

 " use command ':set list' to see hiden charactes
 " use command ':set nolist' to hide hidden characters
 "
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set nolist

"}}}


" ================ SWAP FILE  ======================== {{{

set noswapfile
set nobackup
set nowb

"}}}

" ================ PERSISTENT UNDO ================== {{{

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

"}}}

" ================ FOLDING ========================== {{{

"set foldmethod=indent   "fold based on indent
"set foldnestmax=3       "deepest fold is 3 levels
"set nofoldenable        "dont fold by default

"}}}

" ================ COMPLETITION ===================== {{{

set wildchar=<Tab>
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"}}}

" ================ MAPPINGS ======================== {{{
"
nnoremap <F5> :w<CR> :make<CR>
inoremap <F5> <Esc>:w<CR>:make<CR>
vnoremap <F5> :<C-U>:w<CR>:make<CR>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

nnoremap / /\v
vnoremap / /\v
inoremap jj <ESC>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"pandoc -s --toc -H github.css CLARWE.md -o 5.html
nnoremap <leader>r:!pandoc % -s -toc -H style.css -o %.html

"}}}

