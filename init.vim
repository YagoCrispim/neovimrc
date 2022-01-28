let mapleader=" " " leader key (spacebar)

set relativenumber
set ruler
set title 
set syntax=enable
set list
set clipboard+=unnamedplus
set nowrap
set encoding=utf-8
set noswapfile
set shiftwidth=2
set copyindent
set noswapfile
set smartindent
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set mouse=n " allow resize split windows
set guifont=DroidSansMono\ Nerd\ Font\ 15 " font config

" =-=-=-=-= IDENT CONFIG =-=-=-=-=
set tabstop=8     " tabs are at proper location
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=2  " indenting is 4 spaces
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs

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
map <leader>\ :set wrap<CR>
map <C-p> <ESC>:FZF<CR>
nmap <F1> :NERDTreeToggle %<CR>
map <C-j> <ESC>:below 10sp term://zsh<CR>

" Escaping from terminal
tnoremap <esc> <C-\><C-N>

" exit
nmap <C-Q> :q<CR>
imap <C-Q> <ESC>:q<CR>a

" save file
nmap <C-S> :w<CR>
imap <C-S> <ESC>:w<CR>a

" =-=-=-=-= cocCommands =-=-=-=-=
command! -nargs=0 Prettier :CocCommand prettier.formatFilei
xmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)

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

" run prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" =-=-=-=-= fuzzy finder =-=-=-=-=
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>

" =-=-=-=-= Session control =-=-=-=-=
nnoremap <leader>mk :mksession! ~/.config/nvim/sessions<CR>
nnoremap <leader>ls :source ~/.config/nvim/sessions<CR>

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

  " ???
  Plug 'ianks/vim-tsx'

  " ???
  Plug 'leafgarland/typescript-vim'

  " ???
  Plug 'peitalin/vim-jsx-typescript'

  " ???
  Plug 'sbdchd/neoformat'

  " ???
  Plug 'fatih/vim-go'

  " ???
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " ???
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " ???
  Plug 'mxw/vim-jsx'

  " ???
  Plug 'pangloss/vim-javascript'

call plug#end()

" =-=-=-=-=-=-=-= THEME CONFIG =-=-=-=-=-=-=-=
syntax enable
colorscheme dracula

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" =-=-=-=-= RECHECK =-=-=-=-=-

" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" nnoremap <leader>o o0<C-D>
" nnoremap <leader>O O0<C-D>

" git integration ???
" Plug 'tpope/vim-fugitive'

