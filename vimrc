execute pathogen#infect()
call pathogen#helptags()

syntax on
set background=light
colorscheme peaksea
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

set cursorline
hi CursorLine term=bold cterm=bold ctermbg=White guibg=Grey40

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
let g:airline_theme="light"
