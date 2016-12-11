"" Last update: 07.12.2016 15:15
" vim:filetype=vim
"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  " Run shell script if exist on custom select language

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'shougo/neocomplete.vim'
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript']  }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript']  }
Plug 'gorodinskiy/vim-coloresque'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go', { 'for': 'go'  }
Plug 'nsf/gocode', { 'for': 'go'  }
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required:
"filetype on
"filetype indent on
filetype plugin indent on
set autoindent nosmartindent breakindent
set hidden
set showcmd
set nowrap       " Do not wrap long lines
set lbr          " Better line wrapping (keep words entire)
set noet         " Do not expand tab as multiple spaces"
syntax on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Map leader to ,
let mapleader=','

"" Disable visualbell
set novisualbell t_vb=

"" Configure autocomplete tool
let g:acp_EnableAtStartup = 0

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

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smartindent " Умные отступы (например, автоотступ после {)
set smarttab
retab

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

setlocal cm=blowfish
set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh
set lazyredraw
set matchtime=3
set pastetoggle=<F2>
"" Enhance command-line completion
set completeopt+=menu
set wildmenu

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set ruler
set rnu
set t_Co=256
set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set showmatch " показывать первую парную скобку после ввода второй
set autoread " перечитывать изменённые файлы автоматически
"set confirm " использовать диалоги вместо сообщений об ошибках
set splitright
set splitbelow
set cursorline
set cursorcolumn
set background=dark

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  colorscheme gruvbox
endif

set mouse=a
set mousemodel=popup

"" Status bar
set laststatus=2
set showtabline=2

" To  show special characters in Vim
set list
set listchars=tab:»\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:×
"eol:¶"
set showbreak=↪
set tildeop "~"

set magic

"*****************************************************************************
"" vim-airline
"*****************************************************************************
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#virtualenv#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1


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

"" Map : to ; also in command mode.
nnoremap ; :
vmap ; :

"" Clean search (highlight)
nmap <silent> <leader>/ :noh<cr>
"nnoremap <silent> <leader><space> :noh<cr>
"" Search and replace the word under the cursor
:nnoremap <leader><space> :%s/\<<C-r><C-w>\>/
map // <Plug>(easymotion-prefix)

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" NERDTree
nmap <F3> :NERDTreeToggle<CR>

"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" Edit .vimrc file
nmap <silent> <leader>ov :e $MYVIMRC<CR>
nmap <silent> <leader>sv :w<CR> :so $MYVIMRC<CR>

"" TAB and Shift-TAB in normal mode cycle buffers
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR> 

"" Surround
" ," Surround a word with quotes
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" <leader>' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>
" <leader>) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
map <leader> } ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

map <leader>` ysiw`

"*****************************************************************************
"" Include user's local vim config
"*****************************************************************************
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
