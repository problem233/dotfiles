source $VIMRUNTIME/defaults.vim
if &compatible
  set nocompatible
endif
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8

" basics {{{1
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

filetype on
syntax enable

set ttyfast " faster redrawing
set hidden " hide current buffer when switching to another buffer
set laststatus=2 " always show statusline
set display=lastline " show as much as possible of the last lines
set cursorline " highlight cursor line
set number " show line number
set termguicolors " true color enabled terminal
set background=dark

set incsearch " highlight while searching

set mouse=a

set backup
set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup
set backupskip=
set directory=$HOME/.vim/files/swap/
set updatecount=100
set undofile
set undodir=$HOME/.vim/files/undo/
set viminfo='128,<1024,n$HOME/.vim/viminfo

" custom maps {{{1
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
