let mapleader=" " " leader key (spacebar)

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
" if !1 | finish | endif

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
set scrolloff=5
set expandtab
set mouse=a
set wrap

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

set nosc noru nosm

inoremap {<Enter> {<Enter>}<Esc>O

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

" accept autocomplete with tab
inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" navigation through long line wrapped
vmap <Down> gj
nmap <Down> gj
vmap <Up> gk
nmap <Up> gk

" REMAPS
" map <C-p> <ESC>:FZF<CR>
map <C-p> <cmd>Telescope find_files<cr>

" open nerdtree
nnoremap <silent> <C-b> :NERDTreeToggle %<CR>

" Escaping from terminal
tnoremap <esc> <C-\><C-N>

" if wrap toggle to nowrap
nnoremap <Leader>nw :set nowrap<CR>
nnoremap <Leader>w :set wrap<CR>

" open autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

" ctrl + s to save
noremap <silent> <C-S>          :w<CR>
vnoremap <silent> <C-S>         <C-C>:w<CR>
inoremap <silent> <C-S>         <C-O>:w<CR>

vmap <C-q> :q<CR>
nmap <C-q> :q<CR>

" =-=-=-=-= cocCommands =-=-=-=-=
xmap <silent> <F3>  <Plug>(coc-codeaction-selected)
nmap <silent> <F3>  <Plug>(coc-codeaction-selected)

" rename var
nmap <F2> <Plug>(coc-rename)

" reload current file
nmap <F6> :e<CR>

" coc-definition
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> vd :call CocAction('jumpDefinition')<CR>

" =-=-=-=-= Prettier =-=-=-=-=
" command! -nargs=0 Prettier :CocCommand prettier.formatFile()<CR>
vmap <leader>f  :call CocAction('runCommand', 'prettier.formatFile')<CR>
nmap <leader>f  :call CocAction('runCommand', 'prettier.formatFile')<CR>

" =-=-=-=-= Session control =-=-=-=-=
nnoremap <leader>ms :mksession! ~/.config/nvim/sessions<CR>
nnoremap <leader>ls :source ~/.config/nvim/sessions<CR>

" =-=-=-=-= Vimspector(Debugger) =-=-=-=-=
nnoremap <F5> :call vimspector#Launch()<CR>
nmap <Leader>rd <Plug>VimspectorRestart
" stop debugging
nnoremap <Leader>sd :call vimspector#Reset()<CR>

nnoremap <Leader>tb :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>rb :call vimspector#ClearBreakpoints()<CR>
nnoremap <Leader>cb :call vimspector#ClearLineBreakpoint( @%, line(".") )<CR>

nmap <Leader><Left> <Plug>VimspectorStepOut
nmap <Leader><Up> <Plug>VimspectorStepInto
nmap <Leader><Right> <Plug>VimspectorStepOver
nmap <Leader><Down> :call vimspector#Continue()<CR>
nmap <leader>nh :noh<CR>

" ack remap
nmap     <C-F>f <Plug>CtrlSFPrompt                  
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath

" switch between tabs
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Down> <C-\><C-n><C-w>j
tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l 

" COPILOT
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" auto disable copilot
autocmd VimEnter * Copilot disable

" map to enable copilot
nmap <Leader>ec :Copilot enable<CR>

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

syntax enable

" =-=-=-=-=-=-=-= PLUGINS =-=-=-=-=-=-=-=

" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
  " this is for auto complete, prettier and tslintings needed
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " =-=-=-=-= JAVASCRIPT/TYPESCRIPT =-=-=-=-=
  " these plugins will add highlighting and indenting to JSX and TSX files.
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'

  " =-=-=-=-= PYTHON =-=-=-=-=
  Plug 'davidhalter/jedi-vim' 
  
  " styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " nerdtree
  Plug 'scrooloose/nerdtree'

  " dracula theme
  " Plug 'dracula/vim', { 'name': 'dracula' }
  
  " everforest theme
  Plug 'sainnhe/everforest'

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

  " Debugger
  Plug 'puremourning/vimspector' 

  " Multi cursor
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " Load extensions like VSCode and host language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " prettier
  Plug 'sbdchd/neoformat'

call plug#end()

" =-=-=-=-=-=-=-= THEME CONFIG =-=-=-=-=-=-=-=
" ack config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
let g:ctrlp_show_hidden = 1

" theme config
" colorscheme dracula
set background=dark
colorscheme everforest

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" =-=-=-=-= OTHERS CONFIGS =-=-=-=-=-
"lua << EOF
"require('telescope').setup {
 "defaults = {
   "file_ignore_patterns = {
     "'node_modules/.*'
     "}
 "}
"}
"EOF

" prettier config
let g:neoformat_try_node_exe = 1

" NERDTREE config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeWinSize=45

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
