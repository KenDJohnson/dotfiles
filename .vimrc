imap jf <esc>
set cursorline

set nu
set background=dark
set laststatus=2
"set statusline=%f
set showtabline=2


" statusline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000


" Vundle
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" More plugins to here
Plugin 'tmhedberg/SimpylFold' " Better code folding
Plugin 'vim-syntastic/syntastic'
Plugin 'benmills/vimux' " send commands to tmux
"Plugin 'christoomey/vim-tmux-navigator' " better navigation integration with tmux
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/confirm-quit'


call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle

colorscheme Monokai

let mapleader = " "

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
map <Leader>N :NERDTree ~/nessus_engine/<CR>
map <Leader>p :NERDTree ~/nessus-plugins/<CR>
map <Leader>P :NERDTree ~/rcl/pedant2/<CR>
map <Leader>D :NERDTree ~/rcl/tools/dead_links/<CR>
map <Leader>B :NERDTree ~/rcl/tools/db_browse/<CR>
map <Leader>m :NERDTreeFocus<CR>

" vimux config
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>v1 :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
let g:VimuxHeight = "50"
let g:VimuxOrientation = "h" " v for vertical
let g:VimuxPromptString = "> "


" Syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [],
                            \ 'passive_filetypes': ['python'] }
"" to show it accepts a string of args, also:
let g:syntastic_python_pylint_args = '--rcfile=~/.pylint.rc'
" Run syntax check
nnoremap <C-\> :SyntasticCheck<CR>
" Goto the previous syntax error
nnoremap [ :lprevioius<CR> 
" Goto the next syntax error
nnoremap ] :lnext<CR>
" Close syntastic
nnoremap <Leader>\ :SyntasticReset<CR>
" Only errors
"let g:syntastic_python_pylint_args = '-E'

" buffers
set autowrite " automatically write when switching buffers
nnoremap <Leader>` :ls<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>H :vertical sb bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>K :vertical sb bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>! :vertical sb 1<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>@ :vertical sb 2<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader># :vertical sb 3<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>$ :vertical sb 4<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>% :vertical sb 5<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>^ :vertical sb 6<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>& :vertical sb 7<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>* :vertical sb 8<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>( :vertical sb 9<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>) :vertical sb 10<CR>

"json decode
map <Leader>J :%python -m json.tool

set nocompatible
set path+=**
set wildmenu
set autoread

set ruler

" for search
set ignorecase
set hlsearch

" don't redraw for macros
set lazyredraw

syntax enable

" Folding
set foldmethod=indent
set foldlevel=99 
"tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set ai "auto indent
set si "smart indent

" Python settings
"autocmd BufNewFile,BufRead *.py set filetype=python
"autocmd FileType python setlocal 
"      \ tabstop=4
"      \ softtabstop=4
"      \ shiftwidth=4
"      \ expandtab
"      \ autoindent
"      \ fileformat=unix
"      \ syntax=python



" NASL syntax highlighting
let nasl_space_errors = 1
autocmd BufNewFile,BufRead *.audit set syntax=xml
autocmd BufNewFile,BufRead *.nasl set filetype=nasl
autocmd BufNewFile,BufRead *.inc set filetype=nasl
autocmd BufNewFile,BufRead *.inc set indentexpr=
autocmd FileType nasl setlocal shiftwidth=2 tabstop=2 expandtab softtabstop=20

" toggle for paste
set pastetoggle=<F2>


"set foldmethod=indent   
"set foldnestmax=10
"set nofoldenable
"set foldlevel=2

" cabs - less stupidity                                                      {{{
fu! Single_quote(str)
  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
endfu
fu! Cabbrev(key, value)
  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
    \ a:key, 1+len(a:key), Single_quote(a:value), Single_quote(a:key))
endfu
"}}}


call Cabbrev('te', 'tabedit')
call Cabbrev('tf', 'tabfind')
