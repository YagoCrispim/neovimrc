" leader key
let mapleader=" "

set number
set ruler
set title 
set syntax=enable
set list
set clipboard+=unnamedplus
set nowrap
set encoding=utf-8
set termencoding=utf-8
set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent
set noswapfile

" Change cursor to solid vertical line
" There are problems with Vim's floating window setting cursor to a solid
" block. So these lines below are resetting it to a solid vertical line.
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"

" others
let &titlestring = @%

" allow resize split windows
set mouse=n

" ---------- REMAPS ----------
map <leader>z :<CR> " starts the explorer and open file in current tab
map <leader>l :Ex<CR> " starts the explorer and open file in current tab
map <leader>t :Tex<CR> " starts the explorer and open file in new tab
map <leader>\ :set wrap<CR>
map <C-p> <ESC>:FZF<CR>
nmap <F1> :NERDTreeToggle %<CR>
map <C-j> <ESC>:below 10sp term://zsh<CR>

" Escaping from terminal
tnoremap <esc> <C-\><C-N>

" cocCommands
command! -nargs=0 Prettier :CocCommand prettier.formatFilei
xmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <leader>o o0<C-D>
nnoremap <leader>O O0<C-D>
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>

" run prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fl <cmd>Telescope git_files<cr>

" Session control
nnoremap <leader>mk :mksession! ~/.config/nvim/sessions<CR>
nnoremap <leader>ls :source ~/.config/nvim/sessions<CR>
" ---------- END REMAPS ----------

" ---------- AUTO SYNTAX ----------
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

au BufNewFile,BufRead *.js setlocal filetype=typescript
au BufNewFile,BufRead *.jsx setlocal filetype=typescript.tsx


" ---------- PLUGINS ----------
call plug#begin('~/.vim/plugged')
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sbdchd/neoformat'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'townk/vim-autoclose'
Plug 'dracula/vim', { 'name': 'dracula' }
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()
" ---------- END PLUGINS ----------


" ---------- THEME CONFIG ----------
syntax enable
colorscheme dracula

" set background=dark
" colorscheme palenight

let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:palenight_terminal_italics=1

" ---------- END THEME CONFIG ----------
