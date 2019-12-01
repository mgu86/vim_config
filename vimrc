set nocompatible

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim.git'
Plugin 'Rip-Rip/clang_complete'
Plugin 'vim-scripts/c.vim.git'
Plugin 'ElmCast/elm-vim.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'terryma/vim-multiple-cursors.git'
"Plugin 'vim-scripts/The-NERD-tree.git'
Plugin 'vim-scripts/OmniCppComplete.git'
Plugin 'vim-scripts/pep8.git'
Plugin 'aklt/plantuml-syntax'
Plugin 'fs111/pydoc.vim.git'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips.git'
Plugin 'elixir-lang/vim-elixir.git'
Plugin 'jimenezrick/vimerl.git'
Plugin 'vim-erlang/vim-erlang-tags.git'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'justinmk/vim-sneak.git'
Plugin 'honza/vim-snippets.git'
Plugin 'neoclide/coc.nvim.git'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'psliwka/vim-smoothie.git'

call vundle#end()            " required
filetype plugin indent on    " required


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

" Couleur du popup de completion
if has('gui')
    highlight Pmenu guibg=SteelBlue4 gui=bold
else
"    highlight Pmenu ctermbg=238 gui=bold
    highlight Pmenu guibg=SteelBlue4 gui=bold
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

"# w!! to sudo before saving
cmap w!! w !sudo tee > /dev/null %

""" =====================================================================
""" = Key Mapping =======================================================
""" =====================================================================


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

map <M-LeftMouse> :ptag <C-R><C-W><CR>

"F4  parcours les fichiers include dans 'path' à la recherche du mot sous le curseur
"map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nmap <F4> :Ack! <CR>

"F3 affiche liste buffers et selectionne celui à afficher
map <F3> :ls<CR>:let nr = input("Which one: ")<Bar>exe "buffer" . nr <CR>
map <S-F3> :ls<CR>:let nr = input("Which one: ")<Bar>exe "buffer" . nr <CR>

" Fermer le buffer courant sans fermer la fenêtre
nmap <silent><M-q> :let buffer_to_delete=buffer_number(@%)<Bar>:bn<Bar>exe "bdelete" . buffer_to_delete<CR>

" Mettre en surbrillance la ligne du curseur, uniquement dans le buffer actif
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

"
" La touche TAB, à ma façon
"
nnoremap <TAB> >>
nnoremap <S-TAB> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


""" =====================================================================
""" = Plugins config ====================================================
""" =====================================================================

"-----------------------------------------------------------------------------
" Sneak
"
"-----------------------------------------------------------------------------
let g:sneak#s_next = 1

"-----------------------------------------------------------------------------
" Pep8
"-----------------------------------------------------------------------------
let g:pep8_map='<leader>p'

"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <silent><F7> :NERDTreeToggle<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$',
            \ '\.pyc$', '\.o$' ]

" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }

"-----------------------------------------------------------------------------
" TagBar
"-----------------------------------------------------------------------------
nmap <silent><F8> :TagbarToggle<CR>

"-----------------------------------------------------------------------------
" Ack
"-----------------------------------------------------------------------------
let g:ackprg="ack -H --nogroup --nocolor --column --ignore-file=is:tags"
"let g:ack_autofold_results=1
let g:ackpreview=1

"F4  parcours les fichiers include dans 'path' à la recherche du mot sous le curseur
"map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nmap <F4> :Ack! <CR>


"-----------------------------------------------------------------------------
" OmniCppComplete
"----------------------------------------------------------------------------
"
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
au InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

if v:version >= 700
  set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
  let OmniCpp_GlobalScopeSearch   = 1
  let OmniCpp_DisplayMode         = 1
  let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
  let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
  let OmniCpp_ShowAccess          = 1 "show access in pop-up
  let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
  set completeopt=menuone,menu,longest
endif

" -- ctags --
" add current directory's generated tags file to available tags
set tags+=./tags

""-----------------------------------------------------------------------------
"" Clang-complete
""----------------------------------------------------------------------------
"autocmd FileType c,cpp inoremap <C-space> <C-X><C-U>

let g:clang_use_library=1
let g:clang_periodic_quickfix=0
let g:clang_hl_errors=1
"let g:clang_sort_algo='alpha'
let g:clang_library_path='/usr/lib/llvm-6.0/lib/'
let g:clang_user_options = '-std=c++14'

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 1
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

"automatically select the first entry in the popup menu
let g:clang_auto_select = 1

" The snippets engine (clang_complete, snipmate, ultisnips
let g:clang_snippets = 1
let g:clang_snippets_engine='clang_complete'

" clang should complete preprocessor macros and constants.
let g:clang_complete_macros = 1

" clang_autocomplete configuration

"let g:clang_debug=1
set completeopt=menuone,menu,preview
set pumheight=15





"-----------------------------------------------------------------------------
" PlantUML
"----------------------------------------------------------------------------
autocmd FileType plantuml nmap <F5> :!plantuml % <CR><CR>

"-----------------------------------------------------------------------------
" c/c++
"----------------------------------------------------------------------------
" map <ctrl>+F12 to generate ctags for current folder:
autocmd FileType c,cpp map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
"autocmd FileType c,cpp map <C-F12> :!cscope -Rb<CR>:cscope reset<CR>

" Ajout de fichers tags
"autocmd FileType cpp set tags+=/data/dev4/tags/qt4/qttags
"autocmd FileType cpp set tags+=/data/dev4/tags/stl3.3.tags

" (test) Indentation très contrainte
autocmd FileType cpp set cindent


" Lecture de Manpages dans Vim
autocmd FileType c,cpp source $VIMRUNTIME/ftplugin/man.vim
autocmd FileType c,cpp map <S-K> :Man <cword><CR>

autocmd FileType c,cpp nmap <F5> :make!<CR><CR>
autocmd FileType c,cpp nmap <S-F5> :make! build<CR><CR>
autocmd FileType c,cpp nmap <C-F5> :make! exec<CR><CR>

autocmd FileType c,cpp imap <F5> <C-o>:make!<CR><CR>
autocmd FileType c,cpp imap <S-F5> <C-o>:make! build<CR><CR>
autocmd FileType c,cpp imap <C-F5> <C-o>:make! exec<CR><CR>

 
autocmd FileType c,cpp let g:MGU_recherche_fileext='*.{c,cpp,h,hpp}'

autocmd FileType c,cpp setl ts=4 sw=4 sta noet ai

" Highlight tabs http://tedlogan.com/techblog3.html
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue 

"-----------------------------------------------------------------------------
" Vala
"----------------------------------------------------------------------------
autocmd BufRead,BufNewFile *.vala,*.vapi set filetype=vala

autocmd FileType vala nmap <F5> :make!<CR><CR>
autocmd FileType vala nmap <S-F5> :make! build<CR><CR>
autocmd FileType vala nmap <C-F5> :make! exec<CR><CR>

autocmd FileType vala imap <F5> <C-o>:make!<CR><CR>
autocmd FileType vala imap <S-F5> <C-o>:make! build<CR><CR>
autocmd FileType vala imap <C-F5> <C-o>:make! exec<CR><CR>

"-----------------------------------------------------------------------------
" Python
"----------------------------------------------------------------------------

" map <ctrl>+F12 to generate ctags for current folder:
autocmd FileType python map <C-F12> :!ctags -R --python-kinds=+i --fields=+iaS --extra=+q .<CR><CR>
"autocmd FileType python nnoremap <C-F5> :!python %<CR><bar>:cwindow<CR>
autocmd FileType python nnoremap <F5> :call MGU_exec_capture('python3 -u')<CR>
autocmd FileType python nnoremap <C-F5> :make! exec<CR><CR>


autocmd FileType python setl makeprg=python3\ -u\ '%'
autocmd FileType python setl shellpipe=2\>&1\|\ tee\ exec_python
"autocmd FileChangedShell exec_python :edit!<CR> 
autocmd BufNewFile,BufRead exec_python setl autoread

" * Getting gD ("go to function or class definition") to kinda work
autocmd FileType python noremap <buffer> gD ?\(def\<bar>class\) <c-r>=expand('<cword>')<cr>\><cr>

function! MGU_exec_capture(exec_prg)
    silent exec "!xterm -e \"" . a:exec_prg . " '%' 2>&1 | tee exec_python\""

    "make

    "if bufloaded("exec_python") == 0
    "    setl splitright
    "    vert split exec_python 
    "endif
    cfile exec_python
    vertical botright copen
endfunction

function! MGU_exec(exec_prg)
    silent exec "!xterm -e \"" . a:exec_prg . " '%'\"&"

endfunction

autocmd FileType python set errorformat=\ \ File\ \"%f\"\\,\ line\ %l\\,\ %m,%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"autocmd FileType python setl errorformat=
"	\%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
"	\%C\ \ \ \ %.%#,
"	\%+Z%.%#Error\:\ %.%#,
"	\%A\ \ File\ \"%f\"\\\,\ line\ %l,
"	\%+C\ \ %.%#,
"	\%-C%p^,
"	\%Z%m,
"	\%-G%.%#


" Wrapping and tabs.
autocmd FileType python setl tw=78 ts=4 sw=4 sta et sts=4 ai

let g:pyflakes_use_quickfix=0

"-----------------------------------------------------------------------------
" Makefile
"----------------------------------------------------------------------------
autocmd FileType make set noexpandtab

"----------------------------------------------------------------------------
" Erlang
"----------------------------------------------------------------------------
"autocmd FileType erlang map <C-F12> :!find -name "*.erl" \| xargs erlang_ctags > tags<CR><CR>
autocmd FileType erlang nmap <F5> :make!<CR><CR>
autocmd FileType erlang nmap <S-F5> :make! build<CR><CR>
autocmd FileType erlang nmap <C-F5> :make! exec<CR><CR>
"autocmd FileType erlang nmap <M-F5> :!erlc %<CR>
autocmd FileType erlang imap <F5> <C-o>:make!<CR><CR>
autocmd FileType erlang imap <S-F5> <C-o>:make! build<CR><CR>
autocmd FileType erlang imap <C-F5> <C-o>:make! exec<CR><CR>

" Erlang menus
menu Erlang.Dialyzer\ this\ file        :cexpr system('dialyzer --fullpath '.expand('%'))<CR>
menu Erlang.Typer\ this\ file           :new\|0read !typer # <CR>

" using vim-ref
"
let g:ref_use_vimproc = 1
let g:ref_open = 'split'
let g:ref_cache_dir = expand($MGU_TMP_VIM_DIR . '/vim_ref_cache/')
"nno <leader>K :<C-u>Unite ref/erlang
"            \ -vertical -default-action=split<CR>

" Execute Erlang commands and catch the output to quicklist
"command -nargs=+ Erl :cexpr system('/data/dev4/erlang/pretty_exception/executor.erl "<args>"') | copen

" github.com/vim-erlang/vim-erlang-tags
set  runtimepath^=~/.vim/bundle/vim-erlang-tags
let g:erlang_tags_ignore = ['rel']
let g:erlang_tags_auto_update=1

autocmd FileType erlang map <C-F12> :ErlangTags

" Activate Erlang folding thanks to Vimerl
:let erlang_folding = 1

"-----------------------------------------------------------------------------
" Web
"----------------------------------------------------------------------------
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"-----------------------------------------------------------------------------
" Prolog
"----------------------------------------------------------------------------
let g:filetype_pl="prolog"
autocmd FileType prolog nnoremap <F5> :call MGU_exec('swipl')<CR>
autocmd FileType prolog nmap <F5> :make!<CR><CR>
autocmd FileType prolog nmap <C-F5> :make! exec<CR><CR>

"-----------------------------------------------------------------------------
" Correcteur orthographique
"----------------------------------------------------------------------------
" MGU: too much intrusive, contaminates all the buffersread after
autocmd BufEnter *.md,*.tex set spell spelllang=fr
autocmd BufLeave *.md,*.tex set nospell


"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
" CoC https://github.com/neoclide/coc.nvim
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------
"-----------------------------------------------------------------------------

"" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" Using Coc config
"-----------------------------------------------------------------------------
" Elm
" "-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Elixir
" "-----------------------------------------------------------------------------

" C++
" need "ccls", installed with snap: snapcraft.io/ccls
"
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')
