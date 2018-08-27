" vim:filetype=vim
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'godlygeek/tabular'
Plugin 'ryanoasis/vim-devicons'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'potatoesmaster/i3-vim-syntax'
Plugin 'avr8bit.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'raimondi/delimitmate'
Plugin 'vim-syntastic/syntastic'
Plugin 'ap/vim-css-color'

" On-demand loading
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call vundle#end()		" required
 
filetype plugin indent on	" required

set nobackup
set undofile
set noswapfile
set fileformats=unix,dos,mac
set showcmd
set shell=/bin/bash
set lazyredraw
set display+=lastline
set scrolloff=3
set sidescrolloff=5
set matchtime=3
set mouse=a
set history=200
set textwidth=80
setlocal cm=blowfish

syntax on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Map leader to ,
let mapleader=','

"" Configure autocomplete tool
let g:acp_EnableAtStartup=0

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"" Encoding
set bomb
set binary
set ttyfast
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start
set nowrap
" arrow keys, bs, space wrap to next/prev line
set whichwrap=b,s,<,>,[,]

"" Tabs. May be overriten by autocmd rules
set cindent
"set autoindent
"set smartindent " Умные отступы (например, автоотступ после {)
"set noexpandtab
set shiftround
set shiftwidth=2
set tabstop=2
set smarttab
retab

"" Searching
set hlsearch
set incsearch
set ignorecase
set complete-=i

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set ruler
set nu
"set rnu
set t_Co=256
" set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set showmatch " показывать первую парную скобку после ввода второй
set splitright
set splitbelow
set cursorline
set cursorcolumn
set background=dark

let g:molokai_original=1
color molokai

set pastetoggle=<F2>
set autoread " перечитывать изменённые файлы автоматически

"" Status bar
set laststatus=2
"set showtabline=2

" To  show special characters in Vim
set list
set listchars=tab:»\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:×
"eol:¶"
set showbreak=↪
set tildeop "~"

set magic
set modeline
set modelines=5
set formatoptions+=j " Delete comment characters when joining lines.

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
 
iabbr /** /************************************************************************
iabbr **/ ************************************************************************/
iabbr //- //-----------------------------------------------------------------------


"*****************************************************************************
"" Keymapping
"*****************************************************************************

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus=1
"" NERDTree
nmap <F3> :NERDTreeToggle<CR>

"" Map : to ; also in command mode.
nnoremap ; :
vmap ; :

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

"" Clean search (highlight)
nmap <silent> <leader>/ :noh<cr>


"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"*****************************************************************************
"" vim-airline
"*****************************************************************************
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#virtualenv#enabled=1
"let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tagbar#enabled=1

"*****************************************************************************
"" Include user's local vim config
"*****************************************************************************
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
