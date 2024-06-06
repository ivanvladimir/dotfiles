set nocompatible              " be iMproved, required
filetype off                  " required

hi Normal guibg=black
call plug#begin()

" List your plugins here
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'valloric/youcompleteme'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()
" The following are examples of different formats supported.

filetype plugin indent on    " required
"
map <C-n> :NERDTreeToggle<CR>

set background=dark
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Set map leader
let mapleader = ','

" Fix backspace indentation
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set to auto read when a file is changed from the outside
set autoread

" Menus I like :-)
" This must happen before the syntax system is enabled
" aunmenu Help.
" aunmenu Window.
let no_buffers_menu=1

" this makes the mouse paste a block of text without formatting it 
" (good for code)
map <MouseMiddle> <esc>"*p


" Code Folding, everything folded by default
set foldmethod=indent
set foldlevel=99
set foldenable

" Better modes.  Remeber where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Turn off annoying swapfiles
set noswapfile

" Set persistent undo (v7.3 only)
set undodir=~/.vim/undodir
set undofile

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" <F1> and <F2> for save in all three modes
noremap <F2> <Esc>:w<CR>
inoremap <F2> <Esc>:w<CR>
nnoremap <F2> <Esc>:w<CR>
vnoremap <F2> <Esc>:w<CR>

" Toggle paste with <F9>
set pastetoggle=<F9>

" Enable filetype plugins and indention
filetype on
filetype plugin on

" LATEX
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Activate a permanent ruler 
set ruler
set ttyfast

" Customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmode=list:longest

" Go with smartindent if there is no plugin indent file.
set autoindent  smartindent

" Tab Settings
" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When on uses space instead of tabs
set smarttab
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab


" MiniBuffer 
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" Allways on
let g:miniBufExplorerMoreThanOne = 0

" No broken buffer tabs
let g:miniBufExplTabWrap = 1

" Make it compatible wit TagList
let g:miniBufExplModSelTarget = 1

" One click response
let g:miniBufExplUseSingleClick = 1

"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guifg=LightBlue

" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guifg=Red

" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=Green

" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guifg=Green

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

"Hide abandon buffers in order to not lose undo history.
set hid

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerd Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

" Enable autosave
let g:auto_save =  1800

" Formating files
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown tw=80 fo+=t fo-=l colorcolumn=80 spell spelllang=es_mx wrap
