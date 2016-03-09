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

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

