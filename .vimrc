set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"vimproc
Plugin 'Shougo/vimproc.vim'
"Universal Colour-schemes plugin
Plugin 'flazz/vim-colorschemes'
"Sensible
Plugin 'tpope/vim-sensible'
"YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
"Syntastic syntax checker
Plugin 'vim-syntastic/syntastic'
"Additional syntax highlighting for c++
Plugin 'octol/vim-cpp-enhanced-highlight'
"Auto braces and other stuff
Plugin 'jiangmiao/auto-pairs'
""PEP8 checker
Plugin 'nvie/vim-flake8'
"Haskell syntax highlighting and indentation
Plugin 'neovimhaskell/haskell-vim'
" Nand2Tetris syntax highlighting
Plugin 'sevko/vim-nand2tetris-syntax'
"Flex, bison highlighting
Plugin 'justinmk/vim-syntax-extra'
"Database extensions
Plugin 'vim-scripts/dbext.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"Powerline
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup


"disable compatibility with vi
set nocompatible

"syntax highlighting
syntax on

"enable line numbers
set number

"enable mouse
set mouse=a

set ruler
set showcmd
set visualbell

set autoindent
set smartindent

"highlight matching braces
set showmatch

"intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with space bar
nnoremap <space> za

" Always show status line
set laststatus=2

" wrap lines, tab settings 
set wrap
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=120

"256 colours
set t_Co=256
"use system clipboard
set clipboard=unmanedplus

"PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

"Cool files
au BufNewFile,BufRead *.cl setf cool
au BufNewFile,BufRead *.cool setf cool


"YouCompleteMe global conf file setting
let g:ycm_global_ycm_extra_conf = '/home/aranya/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 

" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Colour schemes:
"colorscheme jay
"colorscheme landscape
"colorscheme desert
"colorscheme cobalt
 "set background=dark
 "let g:gruvbox_contrast_dark='dark'
 "colorscheme gruvbox
 "highlight Normal ctermbg=black
"colorscheme jellybeans
colorscheme molokai
