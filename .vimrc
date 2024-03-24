" Map leader key
let mapleader=";"

" Set termguicolors
set termguicolors

" Set nocompatible for disabling compatibility with Vi
set nocompatible

" Automatically wrap text that extends beyond the screen length
set wrap

" Show line numbers
set number relativenumber

" Status bar
set laststatus=2
set showcmd

"Set foldmethod to marker to use folds using triple curly braces
set foldmethod=marker

"Set cursorline for highlighting the current line number
set cursorline
set cursorlineopt=number

" Set indentation
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4

" Highlighting
set hlsearch

" Showmode
set noshowmode

set listchars=eol:$,tab:<->,space:·,nbsp:+

" Remaps
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz
nnoremap N Nzz
nnoremap n nzz

map <leader>n :bnext<cr>
map <leader>p :bprevious<cr>
map <leader>d :bdelete<cr>
map <leader>w :set list!<cr>

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" Set catppuccin colorscheme (is loaded from plug).
" Make vim background transparent
colorscheme catppuccin_mocha
syntax enable
hi Normal ctermbg=NONE
hi Normal guibg=NONE
hi SpecialKey guifg=#585b70

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_z = '%p%% ☰ %l/%L: %c'
