" Base settings {{{
syntax enable
filetype plugin indent on
set termguicolors
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

" Quickfix item highlighting
sign define notice text=>>

function! s:MarkQFItems()
    sign unplace *
    for item in getqflist()
        execute printf("sign place %d line=%d name=notice", item.lnum, item.lnum)
    endfor
endfunction

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost * call s:MarkQFItems()
augroup end
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itspriddle/vim-shellcheck'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Theme plugin
let g:material_theme_style = 'ocean'
silent! colorscheme material
highlight! Normal ctermfg=white

" vim-go
let g:go_fmt_command = 'goimports' " Run goimports along gofmt on each save
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor
let g:go_auto_sameids = 1
let g:go_updatetime = 400
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
augroup filetype_go
    autocmd!
    autocmd BufWritePost *.go :GoBuild
augroup end
" }}}

