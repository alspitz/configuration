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
set undodir=~/.vim/undo
set undofile

" set relativenumber

colorscheme desert

" Detect glsl files.
autocmd! BufNewFile,BufRead *.glsl,*.geom,*.vert,*.frag,*.gsh,*.vsh,*.fsh,*.vs,*.fs set filetype=glsl

au BufNewFile,BufRead *.cpp,*.h set syntax=cpp
au BufNewFile,BufRead *.ino,*.pde set filetype=arduino
" For ROS Launch files.
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.rosinstall set filetype=yaml

" For texlive.
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" This lets us keep our shiftwidth of 2.
let g:python_recommended_style = 0

highlight ExtraWhitespace ctermbg=Red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * hi ExtraWhitespace ctermbg=Red | match ExtraWhitespace /\s\+$/
autocmd InsertEnter * hi ExtraWhitespace ctermbg=Red | match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * hi ExtraWhitespace ctermbg=Red | match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! Pretty()
  " Add spaces after commas.
  execute '%s/,\([^ ]\)/, \1/g'
  " Add spaces around operators.
  execute '%s/\([^ =]\)\([+*-]\|==\|=\)\([^ =]\)/\1 \2 \3/g'
  execute '%s/\([^ =]\)\([+*-]\|==\|=\)/\1 \2/g'
  execute '%s/\([+*-]\|==\|=\)\([^ =]\)/\1 \2/g'
endfunction

let g:BASH_Ctrl_j = "off"
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
