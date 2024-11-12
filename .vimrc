set number
set wildmenu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set ignorecase
set smartcase
set whichwrap+=<,>,[,]
set backspace=indent,eol,start
set smartindent
set mouse=a
set clipboard=unnamed
set background=light

syntax enable

nnoremap j gj
nnoremap k gk
nnoremap ; :
imap <Up> <C-o>gk
imap <Down> <C-o>gj

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

filetype on
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
