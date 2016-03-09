let mapleader = "\<Space>"

" Vim
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Ctrl-P
nnoremap <leader>cp :CtrlP<CR>
nnoremap <leader>cph :help ctrlp-commands<CR>

" NerdTree
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>ntt :NERDTreeToggle<CR>

" Vundle
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pc :PluginClean<CR>

" Vim Tab
nnoremap <leader><Right> :tabnext<CR>
nnoremap <leader><Left> :tabprevious<CR>

set nocompatible
filetype off

" NERDTree on open
" let g:nerdtree_tabs_open_on_console_startup=1

" set Runtime path to inc Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"
"this is the call to begin the Vundle Plugin Opperation
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tmuxinator/tmuxinator'
Plugin 'jistr/vim-nerdtree-tabs.git'

call vundle#end()

filetype plugin indent on

