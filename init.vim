let mapleader=" " " leader key (spacebar)

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set clipboard=unnamedplus
set number
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set mouse=a

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

set nosc noru nosm

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Ignore case when searching
set ignorecase

" Be smart when using tabs ;)
set smarttab

" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" REMAPS
" map <C-p> <ESC>:FZF<CR>
map <C-p> <cmd>Telescope find_files<cr>

nmap <F1> :NERDTreeToggle %<CR>

" Escaping from terminal
tnoremap <esc> <C-\><C-N>

" open autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

vmap <C-s> :w<CR>
nmap <C-s> :w<CR>

vmap <C-q> :q<CR>
nmap <C-q> :q<CR>

" =-=-=-=-= cocCommands =-=-=-=-=
xmap <silent> <F3>  <Plug>(coc-codeaction-selected)
nmap <silent> <F3>  <Plug>(coc-codeaction-selected)

" rename var
nmap <F2> <Plug>(coc-rename)

" reload current file
nmap <F5> :e<CR>

" coc-definition
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> vd :call CocAction('jumpDefinition')<CR>

" =-=-=-=-= Prettier =-=-=-=-=
command! -nargs=0 Prettier :CocCommand prettier.formatFile()<CR>
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" =-=-=-=-= Session control =-=-=-=-=
nnoremap <leader>ms :mksession! ~/.config/nvim/sessions<CR>
nnoremap <leader>ls :source ~/.config/nvim/sessions<CR>

" =-=-=-=-= Vimspector(Debugger) =-=-=-=-=
nnoremap <Leader>il :call vimspector#Launch()<CR>
nnoremap <Leader>ir :call vimspector#Reset()<CR>
nnoremap <Leader>ic :call vimspector#Continue()<CR>

nnoremap <Leader>tb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>cb :call vimspector#ClearBreakpoints()<CR>

nmap <Leader><Up> <Plug>VimspectorRestart
nmap <Leader><Left> <Plug>VimspectorStepOut
nmap <Leader><Right> <Plug>VimspectorStepInto
nmap <Leader><Down> <Plug>VimspectorStepOver


" =-=-=-=-= Multi line =-=-=-=-=
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'


" =-=-=-=-=-=-=-= AUTO SYNTAX =-=-=-=-=-=-=-=
"au BufNewFile,BufRead *.ts setlocal filetype=typescript
"au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
"au BufNewFile,BufRead *.js setlocal filetype=javascript
"au BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown

" =-=-=-=-=-=-=-= PLUGINS =-=-=-=-=-=-=-=
call plug#begin('~/.vim/plugged')

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
  " nerdtree
  Plug 'scrooloose/nerdtree'

  " dracula theme
  Plug 'dracula/vim', { 'name': 'dracula' }

  " ident lines level
  Plug 'lukas-reineke/indent-blankline.nvim'

  " Comment/Uncomment tool
  Plug 'scrooloose/nerdcommenter'

  " A cool status bar
  Plug 'vim-airline/vim-airline'

  " intellisense engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " auto-close braces and scopes
  Plug 'jiangmiao/auto-pairs'

  " styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " Debugger
  Plug 'puremourning/vimspector' 

  " Multi cursor
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    
  " Srcoll
  " Plug 'karb94/neoscroll.nvim'

  " Load extensions like VSCode and host language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Command-line fuzzy finder
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim' 

call plug#end()

" =-=-=-=-=-=-=-= THEME CONFIG =-=-=-=-=-=-=-=
syntax enable
colorscheme dracula

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


if (has("termguicolors"))
  set termguicolors
endif

lua << EOF
require('telescope').setup {
 defaults = {
   file_ignore_patterns = {
     'node_modules/.*'
     }
 }
}
EOF
