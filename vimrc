filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" " my bundles here
" " original repos on github
" " github上的用户写的插件，使用这种用户名+repo名称的方式
" " Bundle 'tpope/vim-fugitive'
" " Bundle 'Lokaltog/vim-easymotion'
" " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Bundle 'tpope/vim-rails.git'
" " vim-scripts repos
" " vimscripts的repo使用下面的格式，直接是插件名称
Bundle 'taglist.vim'
"Bundle 'SuperTab'
"Bundle 'vimwiki'
"Bundle 'winmanager'
"Bundle 'bufexplorer.zip'
"Bundle 'The-NERD-tree'
"Bundle 'matrix.vim--Yang'
"Bundle 'FencView.vim'
"Bundle 'Conque-Shell'
"Bundle 'Vimpress'
"Bundle 'Markdown'
"Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
"Bundle 'c.vim'
"Bundle 'snipMate'

Bundle 'matrix.vim--Yang'



" non github reposo
" " 非github的插件，可以直接使用其git地址
" " Bundle 'git://git.wincent.com/command-t.git'
" " ...

" "  Brief help
" " :BundleList          - list configured bundles
" " :BundleInstall(!)    - install(update) bundles
" " :BundleSearch(!) foo - search(or refresh cache first) for foo
" " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" "
" " vundle主要就是上面这个四个命令，例如BundleInstall是全部重新安装，BundleInstall!则是更新
" " 一般安装插件的流程为，先BundleSearch一个插件，然后在列表中选中，按i安装
" " 安装完之后，在vimrc中，添加Bundle 'XXX'，使得bundle能够加载，这个插件，同时如果
" " 需要配置这个插件，也是在vimrc中设置即可
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Bundle command are not allowed..


if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" tab and indent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

