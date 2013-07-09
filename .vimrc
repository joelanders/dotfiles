syn on
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set expandtab
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set hid           " allow hidden buffers
set wildchar=<Tab>
set wildmenu
set wildmode=list:full
"set viminfo='100,f1

set showtabline=2

"set undofile
"set undodir=~/.vim/.undo/

syntax enable
set background=light
colorscheme solarized

filetype plugin indent on
autocmd FileType ruby set ai sw=2 sts=2 et

imap jk <Esc>
nnoremap ,, ,
let mapleader = ","
noremap <C-e> 10<C-e>
noremap <C-y> 10<C-y>
map <C-j> 10j
map <C-k> 10k
map <Leader>j 5j
"map <Leader>k 5k
nnoremap <cr> :nohlsearch<cr>
nnoremap <C-H> 20h
nnoremap <C-L> 20l
"nmap <C-n> <C-w>v <C-w>l
"nmap <C-m> <C-w>c
let g:ctrlp_map = ''
nmap <C-p> :tabprevious<CR>
nmap <C-n> :tabnext<CR>
nmap <Leader>t :tabnew<CR>
nmap <Leader>c zz
nmap <Leader>z :q<CR>
nmap <Leader>d :bd<CR>
nmap <Leader>h :new<CR>
nmap <Leader>v :vnew<CR>
"nmap <C-;> :bp<CR>
"nmap <C-'> :bn<CR>

nnoremap <CR> :nohlsearch<CR>

"nnoremap <silent> <Leader>e :CommandT<CR>
nnoremap <silent> <Leader>e :CtrlP<CR>

set t_Co=256

" run the current file
map <Leader>r :w\|:!clear && ./%<CR>
" reverse a selection
vmap <Leader>fR c<C-O>:set ri<CR><C-R>"<Esc>:set nori<CR>

"tests
"map <Leader>s :w\|:!script/specs<CR>
map <Leader>s :w\|:!for i in {1..60}; do echo; done && rspec -c --format doc<CR>
"map <Leader>f :w\|:!script/features<CR>
map <Leader>f :w\|:!for i in {1..60}; do echo; done && cucumber<CR>

" 80 column line
"if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

"nmap <C-m> ggVG<C-c><C-c>

set runtimepath^=~/.vim/bundle/ctrlp.vim

"let g:CommandTMaxHeight=8
"let g:CommandTMatchWindowReverse=1

"map <C-p> <Esc>:only<CR><Esc>:vert belowright split <CR><Esc>:exec("tag ".expand("<cword>"))<CR>
"map <C-p> <Esc>:vert belowright split <CR><Esc>:exec("tag ".expand("<cword>"))<CR>
syntax on
