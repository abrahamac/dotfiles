let mapleader = "\<Space>"

" Add Matchit
runtime macros/matchit.vim

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
" boost CtrlP - End

" Syntastic - Start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:loaded_syntastic_ruby_reek_checker = 1
let g:syntastic_ruby_checkers = ['mri', 'reek', 'flog', 'rubylint']
" let g:syntastic_ruby_mri_exec = '/usr/local/rvm/rubies/ruby-2.2.4/bin/ruby'
" let g:syntastic_ruby_exec = '/usr/local/rvm/rubies/ruby-2.2.4/bin/ruby'
" Syntastic - End 

" YouCompleteMe - Start
" let g:ycm_semantic_triggers =  {
"       \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"       \   'ruby' : ['.', '::']
"   }
" YouCompleteMe - End

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '_'

augroup rubypath

	autocmd!

	autocmd FileType ruby setlocal suffixesadd+=.rb
  autocmd FileType ruby setlocal path+=/usr/local/rvm/rubies/ruby-2.2.4/bin/ruby
  autocmd FileType ruby set omnifunc=syntaxcomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby let g:rubycomplete_rails = 1
augroup END

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-]>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
