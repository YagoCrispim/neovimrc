let mapleader=" " " leader key (spacebar)


" keybindings mswin
source $VIMRUNTIME/mswin.vim
behave mswin


set relativenumber   " count distance from current line to other lines
set tabstop=4        " Show existing tab with 4 spaces width
set softtabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set expandtab        " On pressing tab, insert 4 spaces
set smarttab         " insert tabs on the start of a line according to shiftwidth
set smartindent      " Automatically inserts one extra level of indentation in some cases
set hidden           " Hides the current buffer when a new file is openned
set incsearch        " Incremental search
set ignorecase       " Ingore case in search
set smartcase        " Consider case if there is a upper case character
set scrolloff=10      " Minimum number of lines to keep above and below the cursor
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set signcolumn=yes   " Add a column on the left. Useful for linting
set cmdheight=2      " Give more space for displaying messages
set updatetime=100   " Time in miliseconds to consider the changes
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set nobackup         " No backup files
set nowritebackup    " No backup files
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set autoread         " Update vim after file update from outside
set mouse=a          " Enable mouse support
set nowrap
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Load the indent file for the file type, if any


" =-=-=-=-= IDENT CONFIG =-=-=-=-=
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

filetype indent off
function F_ind()
   let n_ind = indent(line('.'))
   let n_col = col('.') - 1
   if n_col > n_ind
      return "\n" . repeat("\t", n_ind / 2)
   else
      return "\n" . repeat("\t", n_col / 2)
   endif
endfunction
imap <expr> <CR> F_ind()


" =-=-=-=-= Change cursor to solid vertical line =-=-=-=-=
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"
let &titlestring = @%
let g:airline_powerline_fonts = 1
let g:palenight_terminal_italics=1


" =-=-=-=-=-=-=-= REMAPS =-=-=-=-=-=-=-=
map <leader>z :<CR> " starts the explorer and open file in current tab
map <leader>l :Ex<CR> " starts the explorer and open file in current tab
map <leader>t :Tex<CR> " starts the explorer and open file in new tab
map <C-p> <ESC>:FZF<CR>
nmap <F1> :NERDTreeToggle %<CR>
map <C-j> <ESC>:below 10sp term://zsh<CR>

" Escaping from terminal
tnoremap <esc> <C-\><C-N>

" Add new line
imap <Enter> <C-j>

" tab
imap <Tab> <C-t>

" exit
nmap <C-Q> :q<CR>
imap <C-Q> <ESC>:q<CR>a

" save file
nmap <C-S> :w<CR>
imap <C-S> <ESC>:w<CR>a

" CHECK
inoremap <C-E> <C-X><C-E>
inoremap <C-Y> <C-X><C-Y>


" =-=-=-=-= cocCommands =-=-=-=-=
xmap <silent> <F3>  <Plug>(coc-codeaction-selected)
nmap <silent> <F3>  <Plug>(coc-codeaction-selected)

" rename var
nmap <F2> <Plug>(coc-rename)

" reload current file
nmap <F5> :e<CR>

" add number
nmap <F3> :set number<CR>

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


" =-=-=-=-= fuzzy finder =-=-=-=-=
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>


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
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au BufNewFile,BufRead *.js setlocal filetype=javascript
au BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx


" =-=-=-=-=-=-=-= PLUGINS =-=-=-=-=-=-=-=
call plug#begin('~/.vim/plugged')

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
  " nerdtree
  Plug 'scrooloose/nerdtree'

  " autoclose plugin
  Plug 'townk/vim-autoclose'

  " dracula theme
  Plug 'dracula/vim', { 'name': 'dracula' }

  " ident lines level
  Plug 'lukas-reineke/indent-blankline.nvim'

  " Comment/Uncomment tool
  Plug 'scrooloose/nerdcommenter'

  " A cool status bar
  Plug 'vim-airline/vim-airline'

  " Better syntax-highlighting for filetypes in vim
  Plug 'sheerun/vim-polyglot'

  " intellisense engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " auto-close braces and scopes
  Plug 'jiangmiao/auto-pairs'

  " styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " nerdtree icons
  Plug 'ryanoasis/vim-devicons'

  " Debugger
  Plug 'puremourning/vimspector' 

  " Multi cursor
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    
  " Srcoll
  Plug 'karb94/neoscroll.nvim'

  " Syntax highlighting and indenting for TSX
  Plug 'ianks/vim-tsx'

  " Syntax file and other settings for TypeScript
  Plug 'leafgarland/typescript-vim'

  " Syntax highlighting and indentation for JSX in Typescript
  Plug 'peitalin/vim-jsx-typescript'

  " Load extensions like VSCode and host language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Command-line fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " React JSX syntax highlighting and indenting for vim
  Plug 'mxw/vim-jsx'

  " Javascript indentation and syntax support
  Plug 'pangloss/vim-javascript'

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

lua require('neoscroll').setup()
