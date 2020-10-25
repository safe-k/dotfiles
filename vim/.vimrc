" Base settings {{{
syntax enable
filetype plugin indent on
set number
set mouse=a
set omnifunc=syntaxcomplete#Complete
set hlsearch incsearch

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

if has('termguicolors')
    set termguicolors
endif
" }}}

" Mappings {{{
inoremap jk <esc>
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>e :Ex<cr>
nnoremap <leader>k ddkP
nnoremap <leader>j ddp
" }}}

" Editor auto commands {{{
augroup filetype_vim
    autocmd!
    " .vimrc folding
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup completion
  autocmd!
  " Close preview after autocomplete selection
  autocmd CompleteDone * pclose
augroup END
" }}}

" Plugins {{{
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
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

" vim-go
let g:go_fmt_command = 'goimports' " Run goimports along gofmt on each save
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor
let g:go_def_mode='gopls' " Use gopls as LSP
let g:go_info_mode='gopls'
" }}}
