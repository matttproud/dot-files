set nocompatible
"filetype plugin indent on
filetype plugin on
"filetype off
execute pathogen#infect()
call pathogen#helptags()

syntax on
set background=dark
colorscheme adio
set number
set showcmd
set ruler
set hlsearch
set nowrap
set backspace=indent,eol,start
set showmatch
set ignorecase
set smartcase
set hlsearch
" set incsearch

set nobackup
set noswapfile

let g:neocomplete#enable_at_startup = 1

let g:tagbar_type_go = {
   \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F8> :TagbarToggle<CR>
nmap <F2> :browse old<CR>
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

set cursorline

noremap ; :
inoremap jj <ESC>
let mapleader = ","
vmap Q gq
nmap Q gqap

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set laststatus=2
" let g:airline_theme="light"
let g:airline_theme="molokai"
let g:rehash256 = 1
let g:airline#extensions#tabline#enabled = 1
let $PATH = expand('~')."/bin:".$PATH
let $GOPATH = expand('~')

if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
set completeopt=menu
let g:airline_powerline_fonts = 1
let g:go_auto_type_info = 1
let g:neocomplete#enable_at_startup = 1
let g:is_posix = 1
set timeoutlen=250
set ttyfast
set ruler

" let g:airline_left_sep='▶'
" let g:airline_right_sep='◀'

set encoding=utf-8

if &term =~ '256color'
"disable Background Color Erase (BCE)
  set t_ut=
endif

autocmd BufWritePre * %s/\s\+$//e

au BufReadPost *.pi set syntax=python

nnoremap Q <nop>
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

nnoremap <Leader>wr :set wrap! wrap?<CR>

" Case sensitive, partial match inclusive.
nnoremap <Leader>hi :set hlsearch<CR>:let @/='<C-r><C-w>'<CR>
" " Case sensitive, no partial match.
nnoremap <Leader>ho :set hlsearch<CR>:let @/='\<<C-r><C-w>\>'<CR>
" " Case insensitive, partial match inclusive.
nnoremap <Leader>hu :set hlsearch<CR>:let @/='<C-r><C-w>\c'<CR>
" " Case insensitive, no partial match.
nnoremap <Leader>hy :set hlsearch<CR>:let @/='\<<C-r><C-w>\>\c'<CR>

nnoremap <Leader>cl :set cursorline!<CR>
nnoremap <Leader>cc :set cursorcolumn!<CR>
nnoremap <Leader>cx :set cursorcolumn cursorline<CR>
nnoremap <Leader>cn :set nocursorline nocursorcolumn<CR>

nnoremap <Leader>fs 1z=

set wildmenu
