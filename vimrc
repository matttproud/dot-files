filetype plugin on
execute pathogen#infect()
call pathogen#helptags()

syntax on
set background=dark
colorscheme adio
set number
set ruler
set hlsearch

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
nmap Q gqa

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set laststatus=2
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
