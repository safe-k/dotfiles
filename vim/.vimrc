" Enable syntax highlighting
syntax on

" Enable line numbers
set number

" Show the filename in the window titlebar
set title

" Make tabs as wide as two spaces
set tabstop=2

" Highlight searches
set hlsearch

" Load local config if it exists
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

