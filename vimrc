set tabstop=2
set shiftwidth=2
set expandtab
set ru

set smartindent
syn on

imap <tab> <esc>

" Switch between header and source files.
map <F4> :e %:p:s,.h$,X,:s,.cpp$,.h,:s,X$,.cpp,<CR>

" Persistent undos.
set undodir=/home/alex/.vim/undo
set undofile

" set relativenumber

colorscheme desert

" Detect glsl files.
autocmd! BufNewFile,BufRead *.glsl,*.geom,*.vert,*.frag,*.gsh,*.vsh,*.fsh,*.vs,*.fs set filetype=glsl

au BufNewFile,BufRead *.cpp,*.h set syntax=cpp
au BufNewFile,BufRead *.ino,*.pde set filetype=arduino
" For ROS Launch files.
au BufNewFile,BufRead *.launch set filetype=xml

" For texlive.
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" This lets us keep our shiftwidth of 2.
let g:python_recommended_style = 0

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! Pretty()
  " Add spaces after commas.
  execute '%s/,\([^ ]\)/, \1/g'
  " Add spaces around operators.
  execute '%s/\([^ =]\)\([+*-]\|==\|=\)\([^ =]\)/\1 \2 \3/g'
  execute '%s/\([^ =]\)\([+*-]\|==\|=\)/\1 \2/g'
  execute '%s/\([+*-]\|==\|=\)\([^ =]\)/\1 \2/g'
endfunction
