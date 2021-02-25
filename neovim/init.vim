" Base settings {{{
set number
set mouse=a
set undofile
set termguicolors
set fillchars=eob:.
set signcolumn=yes
set updatetime=100
set splitright splitbelow

" netrw
let g:netrw_banner = 0 " Turn off banner
" }}}

" Mappings {{{
inoremap jk <esc>
noremap <leader>q :qa!<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>e :Ex<cr>
nnoremap <leader>\ :nohlsearch<cr>
" Move line up
nnoremap <leader>k ddkP
" Move line down
nnoremap <leader>j ddp
" Yank to clipboard
vnoremap <leader>y "+y
" }}}

" Editor commands {{{
command! FilePath echo expand('%:p')
command! FormatJSON execute ":%!jq ."
" }}}

" Editor auto commands {{{
augroup completion
    autocmd!
    " Close preview after autocomplete selection
    autocmd CompleteDone * pclose
augroup END

augroup file_format
    autocmd!
    " .vimrc folding
    autocmd FileType vim setlocal foldmethod=marker
    " .js/.html indentation	
    autocmd FileType javascript,html setlocal 
		    \ tabstop=4
		    \ shiftwidth=4
		    \ softtabstop=0
		    \ expandtab
    " .css indentation	
    autocmd FileType css setlocal 
		    \ tabstop=2
		    \ shiftwidth=2
		    \ softtabstop=0
		    \ expandtab
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
Plug 'airblade/vim-gitgutter'
" Code
Plug 'tpope/vim-surround'
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

" fzf.vim {{{
function! s:RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --hidden -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call s:RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(
  \ <q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

nnoremap <leader>/ :BLines<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :Rg<cr>
" }}}

" vim-go {{{
let g:go_updatetime = 200
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor
let g:go_doc_popup_window = 1
let g:go_fmt_command = 'goimports' " Run goimports along gofmt on each save
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

augroup filetype_go
    autocmd!
    autocmd BufWritePost *.go :GoBuild
augroup end
" }}}
" }}}
