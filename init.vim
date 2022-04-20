" leader key (spacebar)
let mapleader=" "

set clipboard=unnamedplus
set number
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

" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" init autocmd
autocmd!

" turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" set script encoding
scriptencoding utf-8

" remove auto comment
au FileType * set fo-=c fo-=r fo-=o

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" REMAPS
" add space and 2 spaces between {}
inoremap {<Enter> {<Enter>}<Esc>O

" accept autocomplete with tab
inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"

" navigation through long line wrapped
vmap <Down> gj
nmap <Down> gj
vmap <Up> gk
nmap <Up> gk

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

" ctrl + w to leave
nnoremap <silent> <C-W>         <C-C>:q<CR>

" coc-commands
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

" prettier
vmap <leader>f  :call CocAction('runCommand', 'prettier.formatFile')<CR>
nmap <leader>f  :call CocAction('runCommand', 'prettier.formatFile')<CR>

" session control
nnoremap <leader>ms :mksession! ~/.config/nvim/sessions<CR>
nnoremap <leader>ls :source ~/.config/nvim/sessions<CR>

" vimspector(debugger)
nnoremap <F5> :call vimspector#Launch()<CR>
nmap <Leader>rd <Plug>VimspectorRestart

nnoremap <Leader>sd :call vimspector#Reset()<CR> " stop debugging
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

" copilot
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" auto disable copilot
autocmd VimEnter * Copilot disable

" map to enable copilot
nmap <Leader>ec :Copilot enable<CR>

" javaScript
au BufNewFile,BufRead *.es6 setf javascript

" typeScript
au BufNewFile,BufRead *.tsx setf typescriptreact

" markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown

" =-=-=-=-=-=-=-= PLUGINS =-=-=-=-=-=-=-=
if empty(glob('~/.config/nvim/autoload/plug.vim')) " this will install vim-plug if not installed
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
  " this is for auto complete, prettier and tslintings needed
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

  " js/ts
  Plug 'yuezk/vim-js'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'maxmellon/vim-jsx-pretty'

  " python
  Plug 'davidhalter/jedi-vim' 

  " nerdtree
  Plug 'scrooloose/nerdtree'

  " everforest theme
  Plug 'sainnhe/everforest'

  " ident lines level
  Plug 'lukas-reineke/indent-blankline.nvim'

  " comment/uncomment tool
  Plug 'scrooloose/nerdcommenter'

  " A cool status bar
  Plug 'vim-airline/vim-airline'

  " intellisense engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " auto-close braces and scopes
  Plug 'jiangmiao/auto-pairs'

  " debugger
  Plug 'puremourning/vimspector' 

  " multi cursor
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  " load extensions like VSCode and host language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " prettier
  Plug 'sbdchd/neoformat'

call plug#end()

" =-=-=-=-=-=-=-= THEME CONFIG =-=-=-=-=-=-=-=
set background=dark
colorscheme everforest

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" =-=-=-=-= OTHERS CONFIGS =-=-=-=-=
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-styled-components', 'coc-go']

" ack config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
let g:ctrlp_show_hidden = 1

" default python interpreter
let g:python3_host_prog = $HOME."/.venvs/vim/bin/python"

" prettier config
let g:neoformat_try_node_exe = 1

" nerdtree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeWinSize=30

" multi line
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

syntax enable

