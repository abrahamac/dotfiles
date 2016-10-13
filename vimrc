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
nnoremap <leader>n :tabnew<ESC>:CtrlP<CR>
nnoremap <leader>c :tabclose<CR>

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

" Settings for vim-color-solarized
syntax enable
set background=dark
let g:solarized_termcolors=256 
let g:solarized_termtrans=0 
let g:solarized_degrade=0 
let g:solarized_bold=1 
let g:solarized_underline=1 
let g:solarized_italic=1 
let g:solarized_style="dark" 
let g:solarized_contrast="normal"
colorscheme solarized

" boost CtrlP - Start 
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
" boost CtrlP - End

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '_'

set term=screen-256color
