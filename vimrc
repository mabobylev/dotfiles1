" vim:filetype=vim
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomasr/molokai'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'
" Plugin 'potatoesmaster/i3-vim-syntax'
Plugin 'avr8bit.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ap/vim-css-color'
Plugin 'yggdroot/indentline'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" On-demand loading
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call vundle#end()		" required
 
filetype plugin indent on	" required
syntax on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set nobackup
set undofile
set noswapfile
set fileformats=unix,dos,mac
set showcmd
set shell=/usr/bin/zsh
set lazyredraw
set display+=lastline
set scrolloff=3
set sidescrolloff=5
set matchtime=3
set mouse=a
set history=200
set textwidth=80
setlocal cm=blowfish

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
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

"" Fix backspace indent
set backspace=indent,eol,start
set nowrap
" arrow keys, bs, space wrap to next/prev line
set whichwrap=b,s,<,>,[,]

"" Tabs. May be overriten by autocmd rules
set autoindent
"set cindent
set smartindent " Умные отступы (например, автоотступ после {)
set noexpandtab
set shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
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
set rnu
"set rnu
set t_Co=256
" set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set showmatch " показывать первую парную скобку после ввода второй
set splitright
set splitbelow
set cursorline
set cursorcolumn
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
set background=dark

let g:molokai_original=1
color molokai

set pastetoggle=<F2>
set autoread " перечитывать изменённые файлы автоматически

"" Status bar
"set laststatus=2
"set showtabline=2

" To  show special characters in Vim
set listchars=tab:»\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:×
"eol:¶"
set list
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
"" SuperTab
"*****************************************************************************
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&completefunc:<c-x><c-n>","&omnifunc:<c-x><c-o>"]
let g:SuperTabClosePreviewOnPopupClose = 1

"*****************************************************************************
"" vim-airline
"*****************************************************************************
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
" let g:airline#extensions#virtualenv#enabled=1
" let g:airline#extensions#branch#enabled=1
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tagbar#enabled=1

"*****************************************************************************
"" Различные настройки
"*****************************************************************************
" Необходимо установить для того, чтобы *.h файлам
" присваивался тип c, а не cpp.
let c_syntax_for_h=""

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set ft=c.doxygen
    autocmd BufRead,BufNewFile *.asm set ft=avr8bit
augroup END

" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" Remember cursor position
if has("autocmd")
  augroup vimStartup
    au!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" Enable omni completion.
" if exists("+omnifunc")
"     autocmd Filetype *
"                 \ if &omnifunc == "" |
"                 \  setlocal omnifunc=syntaxcomplete#Complete |
"                 \ endif
" endif

autocmd FileType avr8bit setlocal commentstring=;\ %s

let g:gitgutter_sign_added = '➕'
let g:gitgutter_sign_modified = '✔'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~_'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

"let &path=".,/usr/avr/include,~/avr/inc"
set path+=/usr/avr/include,/home/bma/avr/inc

let loaded_vifm=1

"*****************************************************************************
"" Include user's local vim config
"*****************************************************************************
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
