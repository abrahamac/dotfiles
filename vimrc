let mapleader = "\<Space>"

" Add Matchit
runtime macros/matchit.vim

" Vim
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>rl oRails.log.info ""<ESC>i
nnoremap <leader>jc oconsole.log '';<ESC>hi
nnoremap <leader>ja oalert('');<ESC>hhi

" Ctrl-P
nnoremap <leader>cp :CtrlP<CR>
nnoremap <leader>cph :help ctrlp-commands<CR>

" NerdTree
nnoremap <leader>nt :NERDTree<CR>
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>ntt :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<CR>

" Vundle
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pc :PluginClean<CR>

" Vim Tab
nnoremap <leader><Right> :tabnext<CR>
nnoremap <leader><Left> :tabprevious<CR>
nnoremap <leader>n :tabnew<ESC>:CtrlP<CR>
nnoremap <leader>c :tabclose<CR>

" Vim number toggle
nnoremap <leader>l :set rnu!<CR>

" Ggrep whole project for the word under cursor
nnoremap <leader>s :Ggrep '<cword>'<CR>

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
let g:airline#extensions#tabline#fnamemod = ':t'
set term=xterm-256color

" tagbar by default opens on the right
let g:tagbar_left = 1

" so that status line appear all the time.
set laststatus=2

" make vim use 88 or 256 colors
set t_Co=256

" Settings for vim-color-solarized
syntax enable
set background=dark
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

" Syntastic - Start
"set laststatus=2
"set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" sets the title of the window to the current opened file
set title

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'reek', 'flog', 'rubylint']

" NerdTree Arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Automatically open NerdTree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

filetype on           " Enable filetype detection

"set tags+=/apps/rails_apps/bs/tags
"set complete=i,.,b,w,u,U,]
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

let g:neocomplete#enable_auto_select = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '/apps/rails_apps/learn-rails/.git/tags',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
if !exists('g:neocomplete#sources#member#input_patterns')
  let g:neocomplete#sources#member#input_patterns = {}
endif
let g:neocomplete#sources#member#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
if !exists('g:neocomplete#sources')
  let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer']
let g:neocomplete#sources.ruby = ['dictionary']

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomplete#keyword_patterns['ruby'] = '[^. *\t]\.\w*\|\h\w*::'

