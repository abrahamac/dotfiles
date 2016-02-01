let mapleader = "\<Space>"

nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
noremap <leader>cp :CtrlP<CR>
nnoremap <leader>cph :help ctrlp-commands<CR>

set nocompatible
filetype off

" set Runtime path to inc Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"
"this is the call to begin the Vundle Plugin Opperation
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'

call vundle#end()

filetype plugin indent on

