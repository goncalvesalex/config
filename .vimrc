"colorscheme zellner

filetype plugin indent on

syntax on

set noswapfile
"set number
set nowrap
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set wildmenu
set ignorecase
set smartcase
set hlsearch
set nowrapscan
set splitbelow
set splitright
set hidden
set title
set lazyredraw
set showmatch
set fillchars=""
set paste

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <C-P> :find<space>
nmap <C-F> :grep -ri --include=\*.{c,cpp,h,js,py,ini,cfg,style,pack,xml} --exclude-dir={.git,build,tests} <cword> *
set wildignore+=*/.git/*,*/build/*,*/tests/*

au BufNewFile,BufRead *.cfg set filetype=javascript
au BufNewFile,BufRead *.style set filetype=javascript
au BufNewFile,BufRead *.pack set filetype=javascript
au BufNewFile,BufRead *.ts set filetype=javascript

set path+=**
