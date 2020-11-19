" Base settings {{{
set termguicolors
set number
set mouse=a
set undofile
set omnifunc=syntaxcomplete#Complete
set fillchars=eob:.

" netrw
let g:netrw_banner = 0 " Turn off banner
" }}}

" Mappings {{{
inoremap jk <esc>
nnoremap <leader>w :w<cr>
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>e :Ex<cr>
nnoremap <leader>k ddkP
nnoremap <leader>j ddp
vnoremap <leader>y "+y
" }}}

" Editor commands {{{
command! FilePath echo expand('%:p')
command! FormatJSON execute ":%!jq ."
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
call plug#begin(stdpath('data') . '/plugged')
" Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Utilities
Plug 'itchyny/lightline.vim'
" Code
Plug 'tpope/vim-commentary'
Plug 'itspriddle/vim-shellcheck'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Status bar plugin {{{
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ] ]
      \ },
      \ }
" }}}

" Theme plugin {{{
let g:material_theme_style = 'ocean'
silent! colorscheme material
highlight! Normal guifg=white
" }}}

" vim-go {{{
let g:go_fmt_command = 'goimports' " Run goimports along gofmt on each save
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor
let g:go_auto_sameids = 1
let g:go_updatetime = 400
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_doc_popup_window = 1

augroup filetype_go
    autocmd!
    autocmd BufWritePost *.go :GoBuild
augroup end
" }}}
" }}}
