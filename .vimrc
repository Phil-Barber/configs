:syntax on
:set number
:set relativenumber
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set ruler

set undodir=~/.vim/undodir
set undofile

:set shellcmdflag=-ic

" fold it but unfold it please
set foldmethod=indent
set foldlevelstart=5

:set colorcolumn=80
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
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

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

map <F2> :call TrimWhiteSpace()<CR>

" tree
autocmd StdinReadPre * let s:std_in=1

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" grep ignore
:set wildignore+=*.swp,
:set wildignore+=node_modules/**,

call plug#begin()
Plug 'janko-m/vim-test'
Plug 'junegunn/rainbow_parentheses.vim'
call plug#end()


augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.styled.js set filetype=javascript
augroup END

set nocscopetag
let g:ctags_statusline=1
let g:ale_fix_on_save = 1
set noignorecase
highlight ALEWarning ctermbg=LightBlue
highlight ALEError ctermbg=LightBlue

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Quickfix mappings
nmap <silent> <C-l> :cn<CR>
nmap <silent> <C-p> :cp<CR>


" flow
let g:flow#enable = 0
let g:flow#autoclose = 1


