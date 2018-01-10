set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
"Universal Colour-schemes plugin
Plugin 'flazz/vim-colorschemes'
"Sensible
Plugin 'tpope/vim-sensible'
"YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
"Syntastic syntax checker
Plugin 'vim-syntastic/syntastic'
"Vim hdevtools
Plugin 'bitc/vim-hdevtools'
"Mini map
Plugin 'severin-lemaignan/vim-minimap'
"Nerd tree
Plugin 'scrooloose/nerdtree'
"Nerd tree tabs
Plugin 'jistr/vim-nerdtree-tabs'
"Additional syntax highlighting for c++
Plugin 'octol/vim-cpp-enhanced-highlight'
"Auto braces and other stuff
Plugin 'delimitMate.vim'
"PEP8 checker
Plugin 'nvie/vim-flake8'
"Haskell syntax highlighting and indentation
Plugin 'neovimhaskell/haskell-vim'
"Simply fold
Plugin 'tmhedberg/SimpylFold'
" Nand2Tetris syntax highlighting
Plugin 'sevko/vim-nand2tetris-syntax'
"Nerd tree syntax highlight
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"Vim dev icons
Plugin 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

let delimitMate_expand_cr=1
set nocompatible
let python_highlight_all=1
syntax on
set number
set mouse=a
set ruler
set showcmd
set visualbell
set backspace=indent,eol,start

"Powerline
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup

"Skeleton for cpp files
au BufNewFile *.cpp 0r ~/.vim/skeleton/skeleton.cpp

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" wrap lines, tab settings 
set wrap
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=120

"256 colours
set t_Co=256
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Use system clipboard
set clipboard=unnamedplus
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with space bar
nnoremap <space> za

"PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4|
    \ set softtabstop=4|
    \ set shiftwidth=4|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

" Always show status line
set laststatus=2

"YouCompleteMe conf file setting
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"vim-cpp-enhanced-highlight settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

"Nerd Tree config
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1
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
