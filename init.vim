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
" nnoremap <silent> <C-b> :NERDTreeToggle %<CR>
nnoremap <C-b> :NvimTreeFindFile<CR>
nnoremap <Leader>b :NvimTreeToggle<CR>

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
" autocmd VimEnter * Copilot disable

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
  " Plug 'scrooloose/nerdtree'

  " requires
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'

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





" require'nvim-tree'.setup()

" vimrc
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set renderer.indent_markers.enable (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': "",
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


lua require'nvim-tree'.setup {}

syntax enable
