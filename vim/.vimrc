" Base settings {{{
set termguicolors
set background=dark
syntax enable
filetype plugin indent on
set number
set mouse=a
set omnifunc=syntaxcomplete#Complete
set hlsearch incsearch

" Colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" netrw
let g:netrw_banner = 0 " Turn off banner

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undo

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.
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

" Editor commands {{{
function! FormatJSON()
	execute ":%!jq ."
endfunction
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
Plug 'levelone/tequila-sunrise.vim'
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Theme plugin
silent! colorscheme tequila-sunrise

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
