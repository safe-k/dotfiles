syntax enable
filetype plugin indent on
set number
set mouse=a
set omnifunc=syntaxcomplete#Complete

if has('termguicolors')
    set termguicolors
endif

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'ajmwagar/vim-deus'
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" vim-deus
silent! colors deus

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Language checkers
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" vim-go
" Run goimports along gofmt on each save
let g:go_fmt_command = "goimports"
" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1
" Use gopls as LSP
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

