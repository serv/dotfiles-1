"""
" Start of vim-plug
"""

call plug#begin('~/.vim/plugged')

" Code syntax highlighting
Plug 'https://github.com/sheerun/vim-polyglot'

" Quote and parenthese pairing
" Plug 'https://github.com/jiangmiao/auto-pairs.git'

" Use NERTTree instead of default dir viewer
Plug 'https://github.com/scrooloose/nerdtree.git'

" NERDTree always open
Plug 'https://github.com/jistr/vim-nerdtree-tabs.git'

" Mustache and handlebars syntax and other related features
" Plug 'https://github.com/mustache/vim-mustache-handlebars.git'

" Use Solarized theme
Plug 'https://github.com/altercation/vim-colors-solarized.git'

" Syntax highlighting for Vue.js
Plug 'https://github.com/posva/vim-vue.git'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" adds Go language support for Vim
Plug 'https://github.com/fatih/vim-go'

call plug#end()

"""
" End of vim-plug
"""

" Enable Solarized
syntax enable
set background=dark
try
  colorscheme solarized
catch
endtry

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupcopy=yes
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
" https://jeffkreeftmeijer.com/vim-number/
set number
set nonumber  " turn line numbers off
set number!   " toggle line numbers

" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
" Expand TABs to spaces
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" 80 column layout
set colorcolumn=80
" auto refresh
set autoread
" toggle paste mode
set pastetoggle=<F2>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" remap jj to be an escape character
imap jj <esc>

" automatically strip trailing spaces on save in Vi and Vim
" http://unix.stackexchange.com/questions/75430/how-to-automatically-strip-trailing-spaces-on-save-in-vi-and-vim
autocmd BufWritePre * :%s/\s\+$//e

" NERDTree show hidden dotfiles
" http://stackoverflow.com/a/5057406/536890
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup=1

" For vim-javascript
" https://github.com/pangloss/vim-javascript/pull/199
au BufNewFile,BufRead *.es6 setf javascript

" For ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](bower_components|node_modules|target|dist)|(\.(swp|ico|git|svn))$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Paste mode toggle
" http://stackoverflow.com/a/2514520/536890
set pastetoggle=<F3>



