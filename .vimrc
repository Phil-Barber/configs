:syntax on
:set number
:set relativenumber
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set ruler

set undodir=~/.vim/undodir
set undofile

:set colorcolumn=100
highlight ColorColumn ctermbg=7

set updatetime=100

" I can't type lol
:command Q q
:command W w
:command Vsp vsp
nnoremap Q <nop>

" autocomplete files like bash
set wildmenu
set wildmode=longest,list


" Current file dir
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :split <C-R>=expand("%:p:h") . "/" <CR>

execute pathogen#infect()
filetype plugin indent on

" Cursor change
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

set list listchars=trail:.,extends:>
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" tree
autocmd StdinReadPre * let s:std_in=1

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" grep ignore
:set wildignore+=*.swp,
:set wildignore+=node_modules/**,


" js syntax
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularui = 1
autocmd BufReadPre *.js let b:javascript_lib_use_react = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0

" python syntax
let g:python_highlight_all = 1

call plug#begin()
Plug 'janko-m/vim-test'
call plug#end()

