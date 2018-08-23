" A Vim configure file with fancy features.
" For a lightweighted version, see
" https://gist.github.com/oldsharp/a29856efac8f4dd974ce
"
" Author: Ray Chen <oldsharp@gmail.com>
" License: Public domain

" NOTE: Use ':source $MYVIMRC' to reload '.vimrc'.


set nocompatible


" Basic Vim settings.

colorscheme wombat256mod

" Enable mouse usage (all modes).
if has('mouse')
  set mouse=a
endif

" Precede each line with its line number.
set number

" Show (partial) command in status line.
set showcmd

" Show matching brackets.
set showmatch

" Do case insensitive matching.
set ignorecase

" Do smart case matching.
set smartcase

" Incremental search.
set incsearch

" Automatically save before commands like :next and :make.
set autowrite

" Hide buffers when they are abandoned.
set hidden

" Show the cursor position all the time.
set ruler

" When on, lines longer than the width of the window will wrap and
" displaying continues on the next line.
set wrap


" Maximum column in which to search for syntax items.  In long lines the
" text after this column is not highlighted and following lines may not
" be highlighted correctly, because the syntax state is cleared.
" This helps to avoid very slow redrawing for an XML file that is one
" long line.
" Set to zero to remove the limit (default 3000).
set synmaxcol=0

" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
" mode.
set backspace=indent,eol,start

" A history of ':' commands, and a history of previous search patterns
" are remembered.  This option decides how many entries may be stored
" in each of these histories.
set history=50

" Folds are created manually.
set foldmethod=manual


" Make a backup before overwriting a file.
set writebackup

" The backup is removed after the file was successfully written.
set nobackup

" Use no swapfile for the buffer.  ALL text will be in memory.
set noswapfile


" Force the last window will always have a status line.
set laststatus=2

" Disable 'showmode' since we uses 'vim-airline'.
set noshowmode

" Turn on the List mode.
set list
set listchars=tab:>-,trail:.,nbsp:%,extends:>,precedes:<


" This block of settings will result in spaces being used for all
" indentation.  However, we leave 'tabstop' at its standard value(8).
" NOTE: Use ':retab' to replace all tabs with spaces in current buffer.

" Number of spaces that a <Tab> in the file counts for.
set tabstop=8

" In Insert mode: Use the appropriate number of spaces to insert a
" <Tab>.  Spaces are used in indents with the '>' and '<' commands and
" when 'autoindent' is on.
" NOTE: To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>.
set expandtab

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.  It feels like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s
" is used.
set softtabstop=4

" Number of spaces to use for each step of (auto)indent.  Used for
" 'cindent', >>, <<, etc.
set shiftwidth=4

" Make a <Tab> in front of a line inserts blanks according to
" 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.
" A <BS> will delete a 'shiftwidth' worth of space at the start of the
" line.
set smarttab


" This block of settings control the coding behavior of Vim.

" Sets the character encoding used inside Vim.
set encoding=utf-8

" A list of character encodings considered when starting to edit an
" existing file.  When a file is read, Vim tries to use the first
" mentioned character encoding.  If an error is detected, the next one
" in the list is tried.  When an encoding is found that works,
" 'fileencoding' is set to it.  If all fail, 'fileencoding' is set to
" an empty string, which means the value of 'encoding' is used.
" Note: Use ++enc=encoding to cover 'fileencoding' when opening a file.
set fileencodings=ucs-bom,utf-8,prc,gb18030,taiwan,japan,korea,latin1

" Gives the end-of-line (<EOL>) formats that will be tried when
" starting to edit a new buffer and when reading a file into an
" existing buffer.
set fileformats=unix,dos,mac


" Highlight the screen line of the current cursor.
"set cursorline
"au InsertEnter * set nocursorline
"au InsertLeave * set cursorline

" Highlight the screen column of the current cursor.
" Default to off since that's too noisy.  Uncomment lines below to turn
" this feature on.
"set cursorcolumn
"au InsertEnter * set nocursorcolumn
"au InsertLeave * set cursorcolumn


" Number of colors of the terminal.
set t_Co=256

" Switches on syntax highlighting.
syntax enable

" Switch syntax highlighting on, when the terminal has colors.
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  " Let Vim to overrule your color settings with the defaults.
  syntax on
  " When there is a previous search pattern, highlight all its matches.
  set hlsearch
endif


if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to
  " 72, 'cindent' is on in C files, etc.  Also load indent files, to
  " automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 72 characters.
  autocmd FileType text setlocal textwidth=72

  " Specific settings for c filetype.
  autocmd FileType c setlocal textwidth=0 colorcolumn=80
  autocmd FileType c setlocal ts=8 noet sts=0 sw=8 nosta

  " Specific settings for cmake filetype.
  autocmd FileType cmake setlocal textwidth=120 colorcolumn=120

  " Specific settings for cpp filetype.
  autocmd FileType cpp setlocal textwidth=0 colorcolumn=80
  autocmd FileType cpp setlocal softtabstop=2 shiftwidth=2

  " Specific settings for gitcommit filetype.
  autocmd FileType gitcommit setlocal textwidth=72 colorcolumn=72
  autocmd FileType gitcommit setlocal spell spelllang=en_us

  " Specific settings for gitconfig filetype.
  autocmd FileType gitconfig setlocal ts=8 noet sts=0 sw=8 nosta

  " Specific settings for golang filetype.
  autocmd FileType go setlocal textwidth=0 colorcolumn=80
  autocmd FileType go setlocal ts=8 noet sts=0 sw=8 nosta

  " Specific settings for java filetype.
  autocmd FileType java setlocal textwidth=120 colorcolumn=120
  autocmd FileType java setlocal softtabstop=4 shiftwidth=4

  " Specific settings for javascript filetype.
  autocmd FileType javascript setlocal textwidth=80 colorcolumn=80
  autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2

  " Specific settings for json filetype.
  autocmd FileType json setlocal textwidth=80 colorcolumn=80
  autocmd FileType json setlocal softtabstop=2 shiftwidth=2
  autocmd FileType json setlocal conceallevel=2

  " Specific settings for mail filetype.
  autocmd FileType mail setlocal textwidth=72 colorcolumn=72

  " Specific settings for markdown filetype.
  autocmd FileType markdown setlocal textwidth=72 colorcolumn=72
  let g:vim_markdown_folding_disabled=1
  "let g:vim_markdown_initial_foldlevel=1

  " Specific settings for python filetype.
  autocmd FileType python setlocal textwidth=80 colorcolumn=80
  let python_highlight_all=1
  let python_version_2=1
  "autocmd FileType python map <buffer> <F6> :call Flake8()<CR>
  "autocmd BufWritePost *.py call Flake8()
  autocmd FileType python let b:delimitMate_nesting_quotes = ['"',"'"]

  " Specific settings for ruby filetype.
  autocmd FileType ruby setlocal textwidth=80 colorcolumn=80
  autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2

  " Specific settings for sh filetype.
  autocmd FileType sh setlocal textwidth=80 colorcolumn=80

  " Specific settings for solidity filetype.
  autocmd FileType solidity setlocal textwidth=80 colorcolumn=80
  autocmd FileType solidity setlocal softtabstop=2 shiftwidth=2

  " Specific settings for vim filetype.
  autocmd FileType vim setlocal textwidth=80 colorcolumn=80
  autocmd FileType vim setlocal softtabstop=2 shiftwidth=2

  " Specific settings for xml filetype.
  autocmd FileType xml setlocal textwidth=80 colorcolumn=80
  autocmd FileType xml setlocal softtabstop=2 shiftwidth=2

  " Specific settings for yaml filetype.
  autocmd FileType yaml setlocal textwidth=80 colorcolumn=80
  autocmd FileType yaml setlocal softtabstop=2 shiftwidth=2

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event
  " handler (happens when dropping a file on gvim).  Also don't do it
  " when the mark is in the first line, that is the default position
  " when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else
  " Always set autoindenting on.
  set autoindent

endif


" Convenient command to see the difference between the current buffer
" and the file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


" Turn on pathogen plugin.
execute pathogen#infect()


" Settings for cscope plugin.
":cscope add ./cscope.out


" Keybindings for nerdtree & tagbar plugins.
nnoremap <silent> <F8> :NERDTreeToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>


" Turn off indentLine by default.
let g:indentLine_enabled=0
let g:indentLine_color_term=239
" Can be '¦', '┆', '┊' or '│'.
let g:indentLine_char='│'


" Turn off the fancy powerline fonts for airline.
let g:airline_powerline_fonts=0
" Unicode symbols for airline.  See :help airline.
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_left_sep='>'
let g:airline_left_alt_sep='>'
let g:airline_right_sep='<'
let g:airline_right_alt_sep='<'
let g:airline_symbols.crypt='x'
let g:airline_symbols.linenr='§'
let g:airline_symbols.branch='⎇ '
let g:airline_symbols.whitespace='Ξ'


" Set'let g:loaded_youcompleteme=1' to stop loading YCM at start.
"let g:loaded_youcompleteme=1

" Always load the extra config file without asking.
let g:ycm_confirm_extra_conf=0

" Uncomment lines below to prevent the 'preview' window from show up.
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
