" Pathogen (Plugging manager)
call pathogen#incubate()
call pathogen#helptags()

" No Vi Compatibility. That just sucks.
set nocompatible

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

" Convince Vim it can use 256 colors inside Gnome Terminal.
" Needs CSApprox plugin
set t_Co=256

set background=dark
colorscheme dante

" Set to auto read when a file is changed from the outside
set autoread

" Menus I like :-)
" This must happen before the syntax system is enabled
" aunmenu Help.
" aunmenu Window.
let no_buffers_menu=1

" Mouse
set mouse=
set mousehide

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
set smarttab
set tabstop=4
set sw=4

" Status line
set statusline=%{HasPaste()}%F%m%r%h%w\ \ \ %{&ff},%Y\ \ \ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}ascii=\%03.3b,hex=\%02.2B\ \ \ total=%L%=\ [%{strftime(\"%d/%m/%y\ -\ %H:%M\")}]\ %04l,%04v:%p%%
" Always hide the statusline
set laststatus=2

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

"""""""""""""""""""""""""""""""""""
" Adapt the status line accourding to the window
"""""""""""""""""""""""""""""""""""
if has("autocmd")
    au FileType qf
                \ if &buftype == "quickfix" |
                \     setlocal statusline=%2*%-3.3n%0* |
                \     setlocal statusline+=\ \[Compiler\ Messages\] |
                \     setlocal statusline+=%=%2*\ %<%P |
                \ endif

    fun! <SID>FixMiniBufExplorerTitle()
        if "-MiniBufExplorer-" == bufname("%")
            setlocal statusline=%2*%-3.3n%0*
            setlocal statusline+=\[Buffers\]
            setlocal statusline+=%=%2*\ %<%P
        endif
    endfun

    au BufWinEnter *
                \ let oldwinnr=winnr() |
                \ windo call <SID>FixMiniBufExplorerTitle() |
                \ exec oldwinnr . " wincmd w"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

"Hide abandon buffers in order to not lose undo history.
set hid

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" CloseTag plugin
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" TagBar plugin
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" NERDtree on <leader>t
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" CSS
" " ---
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" rst
" ---
autocmd BufNewFile,BufRead *.rst setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=81
\ formatoptions+=aw textwidth=78

" python
" ------
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
\ formatoptions+=croq softtabstop=4 textwidth=79 smartindent

" markdown
" --------
autocmd BufNewFile,BufRead *.markdown,*.md setf mkd
autocmd FileType mkd setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
\ formatoptions+=aw softtabstop=4 textwidth=78 smartindent

" tex
" ------
autocmd BufNewFile,BufRead *.tex setlocal ft=tex
autocmd FileType tex setlocal noautoindent nocindent nosmartindent spell expandtab shiftwidth=4 tabstop=8 colorcolumn=81
\ formatoptions+=aw softtabstop=4 textwidth=79 indentexpr=
