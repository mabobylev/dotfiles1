" vim: fdm=marker foldenable sw=4 ts=4 sts=4
" 'zo' to open folds, 'zc' to close, 'zn' to disable.

let mapleader = " "

filetype off

call plug#begin('~/.vim/plugged')

Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/avr8bit.vim'
Plug 'ap/vim-css-color'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'jiangmiao/auto-pairs'
" Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

au!
" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile    " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
" -----------------------------------------------------------------------
" VIFM:
" -----------------------------------------------------------------------
let loaded_vifm=1
" -----------------------------------------------------------------------
" MAIN:
" -----------------------------------------------------------------------
" Window display
" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
set background=dark
let g:gruvbox_contrast_dark="hard"
color gruvbox
" set laststatus=2 showtabline=2
" set autochdir
set noshowmode
set lazyredraw
set ttyfast
set magic
set nu
set rnu
set nowrap
" To  show special characters in Vim
set listchars=tab:»\ ,eol:¬,trail:·,extends:❯,precedes:❮,nbsp:×,"eol:¶"
set showbreak=↪
set list
set tildeop "~"
set complete-=i
set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me hen a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
                            " Allow backspace beyond insertion point
set cindent                 " Automatic program indenting
set cinkeys-=0#             " Comments don't fiddle with indenting
set cino=                   " See :h cinoptions-values
set commentstring=\ \ #%s   " When folds are created, add them to this
set copyindent              " Make autoindent use the same chars as prev line
set directory-=.            " Don't store temp files in cwd
set encoding=utf8           " UTF-8 by default
set expandtab               " No tabs
set fileformats=unix,dos,mac  " Prefer Unix
set fileencodings=utf8,cp1251
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-,diff:┄
set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~
set scroll=4                " Number of lines to scroll with ^U/^D
set scrolloff=15            " Keep cursor away from this many chars top/bot
set sessionoptions-=options " Don't save runtimepath in Vim session (see tpope/vim-pathogen docs)
set shiftround              " Shift to certain columns, not just n spaces
set shiftwidth=2            " Number of spaces to shift for autoindent or >,<
set shortmess+=A            " Don't bother me when a swapfile exists
set showmatch               " Hilight matching braces/parens/etc.
set sidescrolloff=3         " Keep cursor away from this many chars left/right
set smartcase               " Lets you search for ALL CAPS
set softtabstop=2           " Spaces 'feel' like tabs
set suffixes+=.pyc          " Ignore these files when tab-completing
set tabstop=2 shiftwidth=2 softtabstop=2
set foldlevelstart=2
"set foldmethod=syntax
"set foldmethod=expr
set noswapfile
set nowritebackup           " No backups made while editing
set whichwrap=b,s,<,>,[,]
set spelllang=en,ru
                            " Unicode chars for diffs/folds, and rely on
                            " Colors for window borders
silent! set foldmethod=marker " Use braces by default
set formatoptions=tcqn1     " t - autowrap normal text
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
                            " 2 - use indenting from 2nd line of para


" SEARCHING FILES:
set path+=**
" Раскрытие списка файлов по <TAB>'у
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion

" Режим вставки по F2
set pastetoggle=<F2>


" FILE MANAGER:
" настройки фм
" :edit открывает просмотр директории фм
" <CR>/v/t - h-split/v-split/tab
" см. также |netrw_browse_maps|
let g:netrw_banner=0        " отключить баннер
let g:netrw_browse_split=4  " открыть в предыдущем окне
let g:netrw_altv=1      " открыть по вертикали
let g:netrw_liststyle=3     " в виде дерева
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview=1       " открыть предпросмотр по вертикали

" AIRLINE:
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" KEYS:
"
" Change indent continuously
vmap < <gv
vmap > >gv

"" Map : to ; also in command mode.
nnoremap ; :
vmap ; :

"" Splits
set splitbelow splitright
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" Удалить подсветку поискового запроса
nmap <silent> <leader>/ :noh<cr>
"nnoremap <silent> <leader>/ :set invhlsearch<CR>

" De-fuckify whitespace
nnoremap <F4> :retab<CR>:%s/\s\+$//e<CR><C-o>

" De-fuckify syntax hilighting
nnoremap <F3> :syn sync fromstart<CR>

" Toggle TagBar
noremap <F5> :TagbarOpenAutoClose<CR>
" noremap <F5> :TagbarToggle<CR>

" Toggle UndoTree
noremap <F6> :UndotreeToggle<CR>

" Editing vimrc
nnoremap ,v :source $MYVIMRC<CR>
nnoremap ,e :edit $MYVIMRC<CR>

" Use the space key to toggle folds
nnoremap <leader> za
vnoremap <leader> zf

" Close all buffers except this one
command! BufCloseOthers %bd|e#

"*****************************************************************************
"" MISC:
"*****************************************************************************
" Необходимо установить для того, чтобы *.h файлам
" присваивался тип c, а не cpp.
let c_syntax_for_h=""

"augroup project
"    autocmd!
"    autocmd BufRead,BufNewFile *.h,*.c set ft=c.doxygen
"augroup END
"
" Добавить modeline последней строкой в буфер.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <leader>ml :call AppendModeline()<CR>

" Quick modeline insert
nnoremap \m ggOvim: et nolist sw=4 ts=4 sts=4<ESC>

"" Better tab
" Create new tabs    \t
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tj :tabNext<CR>
nnoremap <leader>tk :tabprevious<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tq :tabclose<CR>

"" Cycling buffers
nnoremap <leader>bh :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR>
nnoremap <leader>bj :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR>
nnoremap <leader>bk :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR>
nnoremap <leader>bl :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR>
nnoremap <leader>bq :bdelete<CR>

" TAGS:
" Создание файла тэгов (tags).
" Перед использованием необходимо установить ctags
" ^] - переход по тэгу под курсором
" g^] - для неоднозначных меток
" ^t - переход назад по стэку тэгов
"command! MakeTags !ctags -R .
"command! MakeTags !ctags -R -f ~/.vim/systags /usr/include /usr/local/include /usr/avr/include $HOME/avr
command! AVRTags !ctags -R -f ~/avr/tags /usr/avr/include $HOME/avr
set tags+=~/avr/tags

set ofu=syntaxcomplete#Complete
set complete=.,b,t,k,u,k
set completeopt-=preview
set completeopt+=longest
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8

" Spaces Only
au FileType asm,avr8bit,mustache,markdown,cpp,hpp,vim,sh,html,htmldjango,css,sass,scss,javascript,coffee,python,ruby,eruby setl expandtab list

" Tabs Only
au FileType c,h,make setl foldmethod=syntax noexpandtab nolist
au FileType gitconfig,apache,sql setl noexpandtab nolist

" Folding
au FileType html,htmldjango,css,sass,javascript,coffee,python,ruby,eruby setl foldmethod=indent foldenable
au FileType json setl foldmethod=indent foldenable shiftwidth=4 softtabstop=4 tabstop=4 expandtab

" Tabstop/Shiftwidth
au FileType mustache,ruby,eruby,javascript,coffee,sass,scss setl softtabstop=2 shiftwidth=2 tabstop=2
au FileType rst setl softtabstop=3 shiftwidth=3 tabstop=3

" Other
au FileType python let b:python_highlight_all=1
au FileType markdown setl linebreak

" For AVR:
autocmd FileType asm set breakindentopt=shift:8 ft=avr8bit ts=8 st=8

" SPELLCHECK:
autocmd FileType plaintext setlocal spell spelllang=en,ru

" REOPEN VIMRC:
autocmd! BufWritePost ~/.vimrc execute "normal! :source ~/.vimrc"

" Delete all whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Run xrdb whenever Xdefaults are updated
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

"************************************************************************
" SNIPPETS:
"************************************************************************
nnoremap <Leader>html :-1read $HOME/template/skel.html<CR>3jwf>a

"************************************************************************
" ABBREV:
"************************************************************************
iabbr /** /************************************************************************
iabbr **/ ************************************************************************/
iabbr //- //-----------------------------------------------------------------------


