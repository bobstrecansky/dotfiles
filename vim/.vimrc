let $PATH = '/usr/local/bin:'.$PATH
set t_Co=256
set paste
colorscheme badwolf
set nocompatible              " be iMproved, required
filetype off                  " required
set runtimepath+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'
Plugin 'Lokaltog/powerline'
Bundle 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/badwolf'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
set number
set paste
syntax on
set ts=4
set laststatus=2
let $PATH = '/usr/local/bin:'.$PATH
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP ~'
inoremap	jj 	<Esc>
inoremap 	kk	<Esc>
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
" Extra Whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
