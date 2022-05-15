" leader key (spacebar)
let mapleader=" "

filetype plugin indent on

" remaps
source ~/.config/nvim/user/remaps.vim

" plugins
source ~/.config/nvim/user/plugins.vim

" configs
source ~/.config/nvim/user/configs.vim

set clipboard=unnamedplus
set number relativenumber
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=5
set expandtab
set mouse=a
set wrap
set nosc noru nosm
set ignorecase " ignore case when searching
set smarttab

" indentation
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" set script encoding
scriptencoding utf-8

" =============================
"           AUTOCMD
" =============================
" init autocmd
autocmd!

" turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" remove auto comment
au FileType * set fo-=c fo-=r fo-=o

" treesiter
autocmd VimEnter * TSUpdate

" javaScript
au BufNewFile,BufRead *.es6 setf javascript

" typeScript
au BufNewFile,BufRead *.tsx setf typescriptreact

" markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown

" copilot
autocmd VimEnter * Copilot disable

" --

" =============================
"        THEME CONFIG
" =============================
set background=dark
" colorscheme dracula
colorscheme everforest

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" --

" =============================
"        OTHERS CONFIGS
" =============================

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

syntax enable

