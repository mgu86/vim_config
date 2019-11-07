set nocompatible

let $VIMDIR=$HOME . "/.vim"

"let mapleader = ","
let mapleader = "ù"

set backspace=indent,eol,start

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " highligt found occurences
set autowrite           " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)
set number
set smartindent
set autoindent
set shiftwidth=4
set shiftround		"round < ou > to shiftwidth"
set smarttab
set expandtab
set nowrap
set history=700
" nombre de lignes visibles autours du curseur lors d'un scroll (bas ou haut de page)
set scrolloff=2

" Completion of the commands with a menu
set wildmenu
syntax on

" Include local (per project) vimrc
silent! so .vimlocal

set directory=$VIMDIR/swap
" Backup
set backupdir=$VIMDIR/tmpfiles
set backupext=.bak	" Extension .bak
set backup
"Persistent undo
set undodir=$VIMDIR/tmpfiles
set undofile

" Tips coming from this video: www.youtube.com/watch?v=XA2WjJbmmoM

" Search in all subdirectories
" Provides tab-completion for all file-related tasks (open, find...)
" use * as jokers...
set path+=**

"let mapleader = ","
let mapleader = "ù"

" Include local (per project) vimrc
silent! so .vimlocal

filetype plugin indent on

" Theme
if has('gui')
    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    "set guioptions-=r  "remove right-hand scroll bar
    set guioptions+=b   "horizontal scrollbar
    "colorscheme graymgu
    "colorscheme github
    "colorscheme summerfruit256
    colorscheme molokai
else
    colorscheme default
    "colorscheme graymgu
    "colorscheme summerfruit256
endif
set gfn=Liberation\ Mono\ Regular\ 9

" Ma status bar 
set statusline=%f%m%r%h\ %w\ %{fugitive#statusline()}  " nom de fichier et flags
set statusline+=%=%y%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\"}
set statusline+=[%#ErrorMsg#%{coc#status()}%*] 
set statusline+=\ %=%20(l:%03l/%03L\ c:%03c\ [%P]%)

set fillchars=vert:\ ,fold:-

" Relative number configuration
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"" Folding settings
"fold based on indent
set foldmethod=syntax

" don't fold by default
set nofoldenable

" <F6> mapped to fold toggle
nmap <F6> za
" <S-F6> mapped to unfold completely
nmap <S-F6> zR


" use :w!! to write to a file using sudo if you forgot to "sudo vim file"
cmap w!! %!sudo tee > /dev/null %

" toggle highlight search
map  <silent><F11> :set hls!<CR>
imap <silent><F11> <ESC>:set hls!<CR>a
vmap <silent><F11> <ESC>:set hls!<CR>gv

" Highlight matching words, without jumping to the next
nnoremap <silent><C-F11> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>


"key mapping for window navigation
map <C-left> <C-w>h
map <C-down> <C-w>j
map <C-up> <C-w>k
map <C-right> <C-w>l

"key mapping for window sizeing
map <M-left> <C-w>><C-w>>
map <M-right> <C-w><<C-w><
map <M-up> <C-w>+
map <M-down> <C-w>-

" Buffers
" Switch between buffers
if has("unix")
    nmap <silent> œ :bn<CR>
    "nmap <silent> Œ :bp<CR>
    nmap <silent> Œ :buffer <TAB>
else
    if has("win32")
        nmap <silent> ² :bn<CR>
        nmap <silent> <S-²> :bp<CR>
    endif
endif
