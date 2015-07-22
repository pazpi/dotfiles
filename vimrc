" To start vim without using this .vimrc file, use:
"     vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"
" If you are using Arch install this programs that work like plugins
" -ctags (Extra)
" -vim-youcompleteme-git (Aur)
" -vim-airline (Aur)
"
" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible
" Vundle  {{{
filetype off                    " force reloading *after* pathogen loaded
" "------------------------------------------------------------
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" if has("mac")
    " Bundle 'Valloric/YouCompleteMe'
" endif

" Plugin 'gmarik/Vundle.vim'
" if has("mac")
    " Plugin 'bling/vim-airline'
    " Plugin 'altercation/vim-colors-solarized'
" endif

" call vundle#end()            " required
" "------------------------------------------------------------
call plug#begin('~/.vim/plugged')
    if has("mac")
        Plug 'bling/vim-airline'
        Plug 'altercation/vim-colors-solarized'
        Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
    endif

    Plug 'scrooloose/syntastic'
    Plug 'suan/vim-instant-markdown'
    Plug 'junegunn/seoul256.vim'
    Plug 'yegappan/mru'
    Plug 'klen/python-mode'
    Plug 'rstacruz/sparkup'
    Plug 'majutsushi/tagbar'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    "Plug 'joonty/vim-phpqa'
    Plug 'rking/ag.vim'
    "Plug 'octol/vim-cpp-enhanced-highlight' 
    "Plug 'shawncplus/phpcomplete.vim'
    Plug 'sudar/vim-arduino-syntax'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'tomtom/tlib_vim'
    "Plug 'garbas/vim-snipmate'
    "Plug 'honza/vim-snippets'
    "Plug 'sudar/vim-arduino-snippets'
    Plug 'jplaut/vim-arduino-ino'
    Plug 'gaving/vimmpc'
    Plug 'jiangmiao/auto-pairs'
    "Plug 'lervag/vim-latex'
    Plug 'tpope/vim-fugitive'
    " Plug 'nvie/vim-flake8'
    Plug 'gmarik/Vundle.vim'
    Plug 'itchyny/calendar.vim'
    "Plugin ' aperezdc/vim-template/'
    Plug 'vim-scripts/YankRing.vim'
    Plug 'sjl/gundo.vim'
    Plug 'kien/ctrlp.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    " Plug 'KabbAmine/vCoolor.vim'
    Plug 'wincent/command-t'
    " Plug 'msanders/snipmate.vim'
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'tomasr/molokai', { 'dir': '~/.vim/colors'}
    "Plug 'LaTeX-Box-Team/LaTeX-Box'
    Plug 'WolfgangMehner/vim-plugins'
    Plug 'alvan/vim-closetag'
call plug#end()
"------------------------------------------------------------
"let items = fzf#run({ 'sink': 'tabe', 'options': '-m +c', 'dir': '~', 'source': 'ls'  })


filetype plugin indent on       " enable detection, plugins and indenting in one step
syntax enable
set background=dark
"}}}
" Change shell
set shell=bash                  " Vim expects a POSIX-compliant shell, which Fish (my default shell) is not
set t_Co=256
" Change the mapleader from \ to ,
let mapleader=","
let maplocalleader="\\"

" Editing behaviour {{{
" set timeoutlen=50
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
"set ruler
highlight LineNr ctermfg=white  " white line number
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=block           " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·

set nolist                      " don't show invisible characters by default, but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to paste mode, where you can paste mass data that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
"set autowriteall                " Save file when switch buffer
set nrformats=                  " make <C-a> and <C-x> play well with zero-padded numbers (i.e. don't consider them octal or hex)
set cul                         " highlight current line
hi CursolLine term=none cterm=none ctermbg=3    " adjust color
"set shortmess+=I                " hide the launch screen
set clipboard=unnamed           " normal OS clipboard interaction
" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Toggle line numbers
" nnoremap <leader>N :setlocal number!<cr>

" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" }}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
" set foldmethod=marker           " detect triple-{ style fold markers
set foldmethod=syntax
set foldlevelstart=99           " start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
"function Inc(...)
  "let result = g:i
  "let g:i += a:0 > 0 ? a:1 : 1
  "return result
"endfunction

function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>
nnoremap <Space> za
vnoremap <Space> za  
"}}}

" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high
" }}}

" Vim behaviour {{{
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
if v:version >= 730
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)

"Jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
" set title                       " change the terminal's title
let &titleold=getcwd()
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set ttyfast                     " always use a fast terminal
set cursorline                  " underline the current line, for quick orientation
" }}}
                                     
" Toggle the quickfix window {{{
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}

" Toggle the foldcolumn {{{
nnoremap <leader>f :call FoldColumnToggle()<cr>

let g:last_fold_column_width = 4  " Pick a sane default for the foldcolumn

function! FoldColumnToggle()
    if &foldcolumn
        let g:last_fold_column_width = &foldcolumn
        setlocal foldcolumn=0
    else
        let &l:foldcolumn = g:last_fold_column_width
    endif
endfunction
" }}}

nnoremap <leader>Q :q<CR>    " Quickly close the current window
nnoremap <leader>q :bd<CR>   " Quickly close the current buffer

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap
" set breakindent on  " keep paragraph indentation when re-wrapping text

" Sort paragraphs
vnoremap <leader>s !sort -f<CR>gv
nnoremap <leader>s vip!sort -f<CR><Esc>

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Shortcut to make
nnoremap mk :make<CR>

" Use the damn hjkl keys
" noremap <up> <nop>
" noremap <down> <nop>
" noremap <left> <nop>
" noremap <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l
" Complete whole filenames/lines with a quicker shortcut key in insert mode
inoremap <C-f> <C-z><C-f>
inoremap <C-l> <C-z><C-l>
" Quick yanking to the end of the line
nnoremap Y y$

" Edit the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>

" Clears the search register
nnoremap <silent> <leader>\ :nohlsearch<CR>

" Pull word under cursor into LHS of a substitute (for quick search and
" replace)
nnoremap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
"nnoremap n n:call PulseCursorLine()<cr>
"nnoremap N N:call PulseCursorLine()<cr>

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" Quick alignment of text
nnoremap <leader>al :left<CR>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :center<CR>

" Ctrl+W to redraw
"nnoremap <C-w> :redraw!<cr>

" Strip all trailing whitespace from a file, using ,W
"nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" grep/Ack/Ag for the word under cursor
vnoremap <leader>a y:grep! "\b<c-r>"\b"<cr>:cw<cr>
nnoremap <leader>a :grep! "\b<c-r><c-w>\b"
nnoremap K *N:grep! "\b<c-r><c-w>\b"<cr>:cw<cr>

" Allow quick additions to the spelling dict
"nnoremap <leader>g :spellgood <c-r><c-w>

" bind \ (backward slash) to grep shortcut
nnoremap \ :FZF -e<SPACE>

" Creating folds for tags in HTML
"nnoremap <leader>ft Vatzf

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" Gundo.vim
nnoremap <leader>u :GundoToggle<CR>
" }}}




" Restore cursor position upon reopening files {{{
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" }}}
" Extra vi-compatibility {{{
" set extra vi-compatible options
set cpoptions+=$     " when changing a line, don't redisplay, but put a '$' at
                     " the end during the change
set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'
au filetype vim set formatoptions-=o
                     " somehow, during vim filetype detection, this gets set
                     " for vim files, so explicitly unset it again
" }}}

" Pulse ------------------------------------------------------------------- {{{

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 20m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 30m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 30m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" }}}

" Invoke CtrlP, but CommandT style
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" Learn Vim Script the Hard Way Exercises
"noremap - ddp
"noremap _ ddkP

" C-U in insert/normal mode, to uppercase the word under cursor
"inoremap <c-u> <esc>viwUea
"nnoremap <c-u> viwUe

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Define operator-pending mappings to quickly apply commands to function names
" and/or parameter lists in the current line
"onoremap inf :<c-u>normal! 0f(hviw<cr>
"onoremap anf :<c-u>normal! 0f(hvaw<cr>
"onoremap in( :<c-u>normal! 0f(vi(<cr>
"onoremap an( :<c-u>normal! 0f(va(<cr>

" "Next" tag
"onoremap int :<c-u>normal! 0f<vit<cr>
"onoremap ant :<c-u>normal! 0f<vat<cr>

" Function argument selection (change "around argument", change "inside argument")
"onoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>
"vnoremap ia :<c-u>execute "normal! ?[,(]\rwv/[),]\rh"<cr>

" Split previously opened file ('#') in a split window
"nnoremap <leader>sh :execute "leftabove vsplit" bufname('#')<cr>
"nnoremap <leader>sl :execute "rightbelow vsplit" bufname('#')<cr>

" Grep searches
"nnoremap <leader>g :silent execute "grep! -R " . shellescape('<cword>') . " ."<cr>:copen 12<cr>
"nnoremap <leader>G :silent execute "grep! -R " . shellescape('<cWORD>') . " ."<cr>:copen 12<cr>

" Rope config
"nnoremap <leader>A :RopeAutoImport<cr>

" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"let g:solarized_termcolors=256
"colorscheme solarized
"call togglebg#map("<F6>")
" if has("mac")
    " "<<<<<<< Updated upstream
    " "let g:solarized_termcolors=256
    " "colorscheme solarized
    " "call togglebg#map("<F6>")
    " "=======
    " set background=dark
    " colorscheme solarized
    " ">>>>>>> Stashed changes
    " let g:rehash256 = 1
" else
    let g:seoul256_background = 233
    colo seoul256
    " set background=dark
    " colorscheme molokai
    " let g:molokai_original = 1
    " let g:rehash256 = 1
" endif
"-----------------------------------------------------------
"
"vim airline -----------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:Powerline_symbols = "fancy"
set laststatus=2
"-----------------------------------------------------------
"
"NERDTree---------------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>
" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1
" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]
"-----------------------------------------------------------
"
"Pep8 (python-mode)-----------------------------------------
let g:pymode_lint_ignore="E114,E115,E116"
"-----------------------------------------------------------
"
"NerdCommenter----------------------------------------------
let NERDSpaceDelims=1
"-----------------------------------------------------------
"
"MultiCursor------------------------------------------------
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key            = '<C-a>'
let g:multi_cursor_prev_key            = '<C-s>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
"-----------------------------------------------------------
"
"Closetag---------------------------------------------------
let g:closetag_html_style=1
"let g:closetag_filenames = "*.html, *xhtml, *phtml"
"-----------------------------------------------------------
"
"TagBar http://mirnazim.org/writings/vim-plugins-i-use/-----
nnoremap <leader>l :TagbarToggle<CR>
"-----------------------------------------------------------
"
"VimFilter--------------------------------------------------
let g:vimfiler_split_action = 1
"-----------------------------------------------------------
"
" YankRing stuff--------------------------------------------
let g:yankring_history_dir = '$HOME/.vim/.tmp'
nnoremap <leader>r :YRShow<CR>
"-----------------------------------------------------------

"Auto-Pairs-------------------------------------------------
let g:AutoPairsFlyMode = 0
"-----------------------------------------------------------

"Auto-Pairs-------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
"-----------------------------------------------------------
"
"Syntastic--------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"-----------------------------------------------------------
"
"YouCompleteMe----------------------------------------------
"let g:ycm_global_ycm_extra_conf = "~/.vim/python/ycm/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_filetype_whitelist = {'c':0, 'cpp':0, 'python':0, 'objc':0, 'objcpp':0}
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" Global Syntastic options.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
" Syntastic C checker
let g:syntastic_c_compiler_options = ""
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
"-----------------------------------------------------------
"
"Ultisnips--------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<s-b>"
let g:UltiSnipsJumpBackwardTrigger="<s-z>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"-----------------------------------------------------------
"
"Calendar---------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task     = 1
let g:calendar_first_day       = 'monday'
"-----------------------------------------------------------
"
"Easy Align-------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
"-----------------------------------------------------------
"
"Snippets---------------------------------------------------
" let g:snipMate = {}
" let g:snipMate.scope_aliases = {}
"-----------------------------------------------------------
"
"Open Ranger file manager-----------------------------------
" Use ranger as vim file manager
function! Ranger()
    " Get a temp file name without creating it
    let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
    " Launch ranger, passing it the temp file name
    silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
    " If the temp file has been written by ranger
    if filereadable(tmpfile)
        " Get the selected file name from the temp file
        let filetoedit = system('cat '.tmpfile)
        exec 'edit '.filetoedit
        call delete(tmpfile)
    endif
    redraw!
endfunction
nmap <leader>R :call Ranger()<cr>
"-----------------------------------------------------------

" Filetype specific handling {{{
" only do this part when compiled with support for autocommands
if has("autocmd")
    augroup invisible_chars "{{{
        au!

        " Show invisible characters in all of these files
        autocmd filetype vim setlocal list
        autocmd filetype python,rst setlocal list
        autocmd filetype ruby setlocal list
        autocmd filetype javascript,css setlocal list
        autocmd FileType php setlocal makeprg=zca\ %<.php
        autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m
    augroup end "}}}

    augroup vim_files "{{{
        au!

        " Bind <F1> to show the keyword under cursor
        " general help can still be entered manually, with :h
        autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
        autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    augroup end "}}}

    augroup html_files "{{{
        au!

        " This function detects, based on HTML content, whether this is a
        " Django template, or a plain HTML file, and sets filetype accordingly
        fun! s:DetectHTMLVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ '{%\s*\(extends\|load\|block\|if\|for\|include\|trans\)\>'
                    set ft=htmldjango.html
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=html
        endfun

        " Auto-tidy selection
        vnoremap <leader>x :!tidy -q -i --show-errors 0 --show-body-only 1 --wrap 0<cr><cr>

        autocmd BufNewFile,BufRead *.html,*.htm,*.j2 call s:DetectHTMLVariant()

        " Auto-closing of HTML/XML tags
        let g:closetag_default_xml=1
        autocmd filetype html,htmldjango let b:closetag_html_style=1
        autocmd filetype html,xhtml,xml source ~/.vim/scripts/closetag.vim
    augroup end " }}}

    augroup python_files "{{{
        au!

        " This function detects, based on Python content, whether this is a
        " Django file, which may enabling snippet completion for it
        fun! s:DetectPythonVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                    set ft=python.django
                    "set syntax=python
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=python
        endfun
        autocmd BufNewFile,BufRead *.py set ft=python
        autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
        " earlier, as it is important)
        autocmd filetype python setlocal textwidth=78
        autocmd filetype python match ErrorMsg '\%>120v.\+'

        " But disable autowrapping as it is super annoying
        autocmd filetype python setlocal formatoptions-=t

        " Folding for Python (uses syntax/python.vim for fold definitions)
        "autocmd filetype python,rst setlocal nofoldenable
        "autocmd filetype python setlocal foldmethod=expr

        " Python runners
        "autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
        "autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
        "autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
        "autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

        " Toggling True/False
        autocmd filetype python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

        " Run a quick static syntax check every time we save a Python file
        " autocmd BufWritePost *.py call Flake8()

        " Defer to isort for sorting headers (instead of using Unix sort)
        autocmd filetype python nnoremap <leader>s :Isort<cr>
    augroup end " }}}

    augroup supervisord_files "{{{
        au!

        autocmd BufNewFile,BufRead supervisord.conf set ft=dosini
    augroup end " }}}

    augroup markdown_files "{{{
        au!

        autocmd filetype markdown noremap <buffer> <leader>p :w<CR>:!open -a Marked %<CR><CR>
    augroup end " }}}

    augroup ruby_files "{{{
        au!

    augroup end " }}}

    augroup rst_files "{{{
        au!

        " Auto-wrap text around 74 chars
        autocmd filetype rst setlocal textwidth=74
        autocmd filetype rst setlocal formatoptions+=nqt
        autocmd filetype rst match ErrorMsg '\%>74v.\+'
    augroup end " }}}

    augroup css_files "{{{
        au!

        autocmd filetype css,less setlocal foldmethod=marker foldmarker={,}
    augroup end "}}}

    augroup javascript_files "{{{
        au!

        autocmd filetype javascript setlocal expandtab
        autocmd filetype javascript setlocal listchars=trail:·,extends:#,nbsp:·
        autocmd filetype javascript setlocal foldmethod=marker foldmarker={,}

        " Toggling True/False
        autocmd filetype javascript nnoremap <silent> <C-t> mmviw:s/true\\|false/\={'true':'false','false':'true'}[submatch(0)]/<CR>`m:nohlsearch<CR>

        " Enable insertion of "debugger" statement in JS files
        autocmd filetype javascript nnoremap <leader>b Odebugger;<esc>
    augroup end "}}}

    augroup textile_files "{{{
        au!

        autocmd filetype textile set tw=78 wrap

        " Render YAML front matter inside Textile documents as comments
        autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
        autocmd filetype textile highlight link frontmatter Comment
    augroup end "}}}
endif
" }}}

 "Skeleton processing {{{

"if has("autocmd")

    ""if !exists('*LoadTemplate')
    ""function LoadTemplate(file)
        """ Add skeleton fillings for Python (normal and unittest) files
        ""if a:file =~ 'test_.*\.py$'
            ""execute "0r ~/.vim/skeleton/test_template.py"
        ""elseif a:file =~ '.*\.py$'
            ""execute "0r ~/.vim/skeleton/template.py"
        ""endif
    ""endfunction
    ""endif

    ""autocmd BufNewFile * call LoadTemplate(@%)

"endif " has("autocmd")

" }}}
