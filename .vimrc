let $PATH = '/usr/local/bin:'.$PATH
set t_Co=256
set paste
colorscheme badwolf
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'
Plugin 'Lokaltog/powerline'
Bundle 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/badwolf'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
set number
syntax on
set ts=2
"colorscheme badwolf
"source /Library/Python/2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Automatically open NerdTree on Open
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let $PATH = '/usr/local/bin:'.$PATH
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_warning_symbol = '.'
let g:ycm_error_symbol = '..'
let g:ycm_server_use_vim_stdout = 0


inoremap	jj 	<Esc>
inoremap 	kk	<Esc>
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
" Extra Whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
