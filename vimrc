set tabstop=2
set shiftwidth=2
set expandtab
set ru

set smartindent
syn on

map <tab> <esc>
imap <tab> <esc>

set pastetoggle=<F3>

" Switch between header and source files.
map <F4> :e %:p:s,.h$,X,:s,.cpp$,.h,:s,X$,.cpp,<CR>

" Persistent undos.
set undodir=~/.vim/undo
set undofile

set clipboard=unnamedplus

" set relativenumber

colorscheme desert

" Detect glsl files.
autocmd! BufNewFile,BufRead *.glsl,*.geom,*.vert,*.frag,*.gsh,*.vsh,*.fsh,*.vs,*.fs set filetype=glsl

au BufNewFile,BufRead *.cpp,*.h set syntax=cpp
au BufNewFile,BufRead *.ino,*.pde set filetype=arduino
" For ROS Launch files.
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.rosinstall set filetype=yaml
" For .make files
au BufNewFile,BufRead *.make set filetype=make

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" For texlive.
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_GotoError = 0
let g:Tex_MultipleCompileFormats = "pdf"
let g:Imap_UsePlaceHolders = 0

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
  execute '%s/\([^ =]\)\([+*-]\|==\|=\|&&\|||\)\([^ =]\)/\1 \2 \3/g'
  execute '%s/\([^ =]\)\([+*-]\|==\|=\)/\1 \2/g'
  execute '%s/\([+*-]\|==\|=\)\([^ =]\)/\1 \2/g'
endfunction

let g:BASH_Ctrl_j = "off"

" Vim's imaps(?) comes with a jump forward binding for Ctrl-J; move it somewhere else.
nmap <unique> <c-n> <Plug>IMAP_JumpForward
" Vim's netrw comes with a refresh binding for Ctrl-L; move it somewhere else.
nmap <unique> <c-b> <Plug>NetrwRefresh

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap <A-h> :tabprevious<CR>
nnoremap <A-l> :tabnext<CR>
nnoremap è :tabprevious<CR>
nnoremap ì :tabnext<CR>

nnoremap <C-o> <C-w><
nnoremap <C-p> <C-w>>
