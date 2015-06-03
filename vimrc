set tabstop=2
set shiftwidth=2
set expandtab
set ru

set smartindent
syn on

imap <tab> <esc>

" Switch between header and source files
map <F4> :e %:p:s,.h$,X,:s,.cpp$,.h,:s,X$,.cpp,<CR>

" Persistent undos
set undodir=/home/alex/.vim/undo
set undofile

set relativenumber

" Detect glsl files.
autocmd! BufNewFile,BufRead *.glsl,*.geom,*.vert,*.frag,*.gsh,*.vsh,*.fsh,*.vs,*.fs set filetype=glsl

au BufNewFile,BufRead *.cpp,*.h set syntax=cpp11
au BufNewFile,BufRead *.ino,*.pde set filetype=arduino
