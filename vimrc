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
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" Custom Vim Copy/Paste
vmap <leader>c :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

" Custom Vim copy and open in firefox
vmap <leader>f :w! /tmp/vitmp<ESC>:!firefox /tmp/vitmp<CR>

" Tagbar shortcuts
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>t :TagbarOpen fjc<CR>

" Use 2 spaces for all indentation
set tabstop=2
set shiftwidth=2
set expandtab
set number

" Enable mouse use in all modes
set mouse=a

" Open new split panes to right and bottom
set splitbelow
set splitright

" set dot for tab and tailing spaces
set list lcs=trail:·,tab:»·

" set color
highlight ColorColumn ctermbg=black
call matchadd('ColorColumn', '\%81v', 100) "set column nr

" Always use vertical diffs
set diffopt+=vertical

set history=1000
set undolevels=1000

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" powerline fonts for status bar icons
let g:airline_powerline_fonts = 1
" tagbar by default opens on the right
let g:tagbar_left = 1
" so that status line appear all the time.
set laststatus=2
