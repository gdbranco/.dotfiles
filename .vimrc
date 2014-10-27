set number
set t_Co=256
set hidden
"set mouse=a
colorscheme distinguished
set tabstop=4
set shiftwidth=4
set timeoutlen=1000
set ttimeoutlen=0
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'osyo-manga/vim-marching'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'benmills/vimux'
call vundle#end()

syntax on
filetype indent on
filetype plugin on

"NERD TREE
map :Nt :NERDTree
nnoremap <C-N> :NERDTreeToggle<CR>

"CD to dir
autocmd VimEnter * lcd %:p:h

"Highlight curretline
set cursorline
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
"Mantem a mesma cursor highligh
set nostartofline

"vim CFG
"let mapleader ='\'
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>e :e 
nnoremap <Leader>q :bp <BAR> bd #<CR>

let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"Mixed indent warning off
let g:airline#extensions#whitespace#enabled = 0
set laststatus=2

"
"YCM CFG
"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
"let g:ycm_register_as_syntastic_checker = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger = 0

set completeopt-=preview
"Syntastic CFG
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_check_on_open=1
let g:synstastic_enable_signs=1
let g:synstastic_python_python_exec = '!/usr/bin/python3.4'
"Ctrl+S reach vim
silent !stty -ixon > /dev/null 2>/dev/null
nnoremap <C-S> :w<CR>
"C++11 support
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_opetions = ' -std=c++11 -stdlib=libc++'
