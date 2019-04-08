"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Theme
set background=light
colorscheme molokai

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Addons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
set nocompatible

" Quick Exiting and Saving
nnoremap <silent> q :q!<CR>
nnoremap <silent> w :w!<CR>

" Paste is useful when pasting from non-vim sources
nnoremap <silent> <F2> :set paste<CR>
nnoremap <silent> <F3> :set nopaste<CR>
" Remove all trailing whitespace by pressing F4
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Update Plugins
nnoremap <silent> <F5> :PlugUpdate<CR>

" Easy Window Switching
nmap <silent> <C-m> :wincmd l<CR>

" More intuitive start and end
noremap <buffer> <silent> - 0
noremap <buffer> <silent> = $
noremap 0 <Nop>
noremap $ <Nop>

" I like to keep my hands wider
noremap j h
noremap k gj
noremap l gk
noremap ; l

call plug#begin('~/.vim/plugged')
" Core
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-slash'

" Extension
Plug 'raimondi/delimitmate'
Plug 'roman/golden-ratio'
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'itchyny/lightline.vim'

call plug#end()
