syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Set the textwidth to be 80 chars
set textwidth=120

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Set title on X window
set title

" Global
set hidden ruler wmnu               " Hide buffer instead of abandoning when unloading

set wildmenu                        " Enhanced command line completion
set wildmode=list:longest           " Complete files like a shell
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo,*app/cache/**,*app/logs/**,*/zend/**,*/bootstrap.*.*

set showcmd                         " Display incomplete commands
set showmode                        " Display the mode you're in

set number                          " Show line numbers
set ruler                           " Show cursor position

set incsearch                       " Highlight matches as you type
set hlsearch                        " Highlight matches
set ignorecase                      " set case insensitivity
set smartcase                       " unless there's a capital letter
set wrap                            " Turn on line wrapping
set scrolloff=3                     " Show 3 lines of context around the cursor

set nobackup                        " Don't make a backup before overwriting a file
set nowritebackup                   " And again
set noswapfile                      " Use an SCM instead of swap files

set backspace=indent,eol,start      " http://vim.wikia.com/wiki/Backspace_and_delete_problems

set expandtab
set copyindent                      " copy the previous indentation on autoindenting
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                       " set show matching parenthesis
set autoindent

set undolevels=1000                 " use many levels of undo

if version >= 730
    set noundofile                  " Don't keep a persistent undofile
endif

" sudo to write
command W w !sudo tee % > /dev/null
