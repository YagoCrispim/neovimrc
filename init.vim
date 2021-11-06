" leader key
let mapleader=" "

set number
set ruler
set title 
set syntax=enable
set list
set clipboard=unnamedplus
set clipboard=unnamed
set clipboard+=unnamedplus
set nowrap
set encoding=utf-8
set termencoding=utf-8
set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" set autoindent
"set copyindent
set noswapfile
set guifont=Nerd\ 11

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
nmap <F2> :NERDTreeToggle %<CR>
nmap <F5> :e %<CR>
noremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" cocCommands
command! -nargs=0 Prettier :CocCommand prettier.formatFilei
xmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)
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
noremap <F3> <Plug>(coc-format-selected)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" OPEN TERMINAL
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-j> :call OpenTerminal()<CR>

" ---------- AUTO SYNTAX ----------
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" ---------- PLUGINS ----------
call plug#begin('~/.vim/plugged')
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'sbdchd/neoformat'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'townk/vim-autoclose'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'styled-components/vim-styled-components'

" FILE SEARCH
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ----- FILE EXPLORER -----
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

"nerdtree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''

"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ----- END FILE EXPLORER -----

call plug#end()

" ---------- THEME CONFIG ----------

" ----- FILE SEARCH CONFIG -----

nnoremap <c-p> :Files<cr>

" ----- FILE SEARCH CONFIG END -----

" packadd! dracula
syntax enable
colorscheme dracula
